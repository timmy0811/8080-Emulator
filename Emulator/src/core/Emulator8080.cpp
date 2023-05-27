#include "Emulator8080.h"

e8080::Emulator8080::Emulator8080()
	:m_State(true) // Clear Ram on Init
{
	m_State.SP = 0x2200; // Set Stack pointer on work ram / 2
}

e8080::Emulator8080::~Emulator8080()
{
	delete[] m_RomBuffer;
	delete[] m_RamBuffer;
	delete[] m_RamBufferUpdated;
	delete[] m_RomDisassembledArr;
}

bool e8080::Emulator8080::disassemble()
{
	if (!m_RomBuffer) {
		LOGC("Load Rom file before disassembling", LOG_COLOR::WARNING);
		return false;
	}

	size_t romPtr = 0x0;
	m_RomDisassembled = fmt::format("; Source: {}\n; Disassembled by 8080Emulator-Util\n\n; 8080 Assembler		| Rom in hex\n;---------------------------------------------\n", m_RomPath);
	while (romPtr < m_RomBufferSize) {
		const unsigned char byte = *(m_RomBuffer + romPtr);
		m_RomDisassembled += getAsssemblerLine(byte, romPtr);

		romPtr++;
	}

	m_SystemFlags |= 1; // Set flag for reloading codeBuffer
	return true;
}

bool e8080::Emulator8080::loadRomFromFile(const std::string& path)
{
	std::ifstream romCode(path, std::ios::binary | std::ios::ate);
	if (!romCode.is_open()) {
		LOGC("Failed loading Rom: " + path, LOG_COLOR::FAULT);
		return false;
	}

	// Get the size of the file
	std::streamsize size = romCode.tellg();
	romCode.seekg(0, std::ios::beg);

	// Read the file into a vector
	std::vector<char> buffer(size);
	if (!romCode.read(buffer.data(), size)) {
		LOGC("Failed loading Rom into memory: " + path, LOG_COLOR::FAULT);
		return false;
	}

	m_RomBuffer = (unsigned char*)std::malloc(size);
	m_RomBufferSize = buffer.size();
	std::memcpy(m_RomBuffer, buffer.data(), size);

	romCode.close();

	m_RomPath = path;
	return true;
}

bool e8080::Emulator8080::saveDisassembledToFile(const std::string& path)
{
	std::ofstream outFile(path);

	if (outFile.is_open())
	{
		outFile << m_RomDisassembled;
		outFile.close();
	}
	else {
		std::cerr << "Unable to open file";
		LOGC("Error: Cannot write disassembled to file!", LOG_COLOR::FAULT);
	}

	return false;
}

void e8080::Emulator8080::executeProgram(float clockMHz)
{
	m_State.PC = 0x0000;
	m_ClockMHz = clockMHz;

	while (m_State.PC < m_RomBufferSize) {
		const unsigned char byte = *(m_RomBuffer + m_State.PC);
		executeInstruction(byte);
	}
}

void e8080::Emulator8080::executeCurrentInstruction()
{
	const unsigned char byte = *(m_RomBuffer + m_State.PC);
	executeInstruction(byte);
}

void e8080::Emulator8080::continueProgram()
{
	while (m_State.PC < m_RomBufferSize) {
		const unsigned char byte = *(m_RomBuffer + m_State.PC);
		executeInstruction(byte);
	}
}

void e8080::Emulator8080::OnUpdate()
{
}

void e8080::Emulator8080::OnGuiRender()
{
	static bool reinit = true;
	static bool init = true;
	if (!reinit) reinit = Configuration::Global::updateResize;

	// Code Window
	if (reinit) {
		ImGui::SetNextWindowPos({ 10, 10 });
		ImGui::SetNextWindowSize({ gl::windowSize.x / 3.f, gl::windowSize.y - 20.f });
	}

	ImGui::Begin("Program Code");
	ImGui::Columns(2, nullptr, false);
	ImGui::SetColumnWidth(0, (gl::windowSize.x / 3.f - 20) / 2.f);
	ImGui::SetColumnWidth(1, (gl::windowSize.x / 3.f - 20) / 2.f);

	int pcTemp = (int)m_State.PC;
	ImGui::InputInt("PC", &pcTemp, 1);
	m_State.PC = (uint16_t)pcTemp;
	ImGui::NextColumn();

	static std::string abc;
	ImGui::Text(fmt::format("Instruction: {}", abc).c_str());
	ImGui::NextColumn();

	ImGui::Text(fmt::format("Par1: {} [{}]", "0xFF", "255").c_str());
	ImGui::NextColumn();

	ImGui::Text(fmt::format("Par2: {} [{}]", "0xFF", "255").c_str());

	ImGui::Columns(1);  // Reset columns

	ImGui::Separator();

	if (m_RomDisassembled.size() > 0 && m_SystemFlags & 1) {
		delete[] m_RomDisassembledArr;
		size_t size = m_RomDisassembled.size() + 1;
		m_RomDisassembledArr = new char[size];

		std::copy(m_RomDisassembled.begin(), m_RomDisassembled.end(), m_RomDisassembledArr);
		m_RomDisassembledArr[size - 1] = '\0';

		m_SystemFlags &= 0;
	}

	const ImVec2 windowSize = ImGui::GetWindowSize();
	const ImVec2 windowPos = ImGui::GetWindowPos();

	// Calculate available vertical space remaining in the window
	const float availableHeight = gl::windowSize.y - 20.f - ImGui::GetCursorPos().y - 10.f;

	if (m_RomDisassembledArr) ImGui::InputTextMultiline(" ", m_RomDisassembledArr, m_RomDisassembled.size() + 1, ImVec2(gl::windowSize.x - 20.f, availableHeight), ImGuiInputTextFlags_ReadOnly);
	else ImGui::Text("Load rom file first!");

	ImGui::End();

	// Controll Window
	if (reinit) {
		ImGui::SetNextWindowPos({ gl::windowSize.x / 3.f + 20.f, 10 });
		ImGui::SetNextWindowSize({ gl::windowSize.x / 3.f - 10.f, gl::windowSize.y / 6.f });
	}

	ImGui::Begin("Emulator Controll");
	ImGui::Columns(3, nullptr, false);
	ImGui::SetColumnWidth(0, (gl::windowSize.x / 3.f - 20) / 3.f);
	ImGui::SetColumnWidth(1, (gl::windowSize.x / 3.f - 20) / 3.f);
	ImGui::SetColumnWidth(2, (gl::windowSize.x / 3.f - 20) / 3.f);

	if (ImGui::Button("Step", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = false;
		executeCurrentInstruction();
	}
	ImGui::NextColumn();

	if (ImGui::Button("Step Over", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = false;
		int instructionWidth = 1; // ToDo: Get Instruction width ???
		m_State.PC += instructionWidth;
	}
	ImGui::NextColumn();

	if (ImGui::Button("Halt", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = false;
	}
	ImGui::NextColumn();

	ImGui::Separator();

	if (ImGui::Button("Run", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = true;
	}
	ImGui::NextColumn();

	if (ImGui::Button("Reset PC", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = false;
		m_State.PC = 0;
	}
	ImGui::NextColumn();

	if (ImGui::Button("Reset", { (gl::windowSize.x / 3.f - 20) / 3.f - 5.f, 30.f })) {
		m_InExecution = false;
		m_State.PC = 0;
		// ToDo: Reset Ram, ...
	}
	ImGui::Columns(1);  // Reset columns

	ImGui::End();

	// Ram View
	if (reinit) {
		ImGui::SetNextWindowPos({ gl::windowSize.x / 3.f * 2 + 20.f, 10 });
		ImGui::SetNextWindowSize({ gl::windowSize.x / 3.f - 30.f , gl::windowSize.y - 20.f });
	}

	ImGui::Begin("Ram View");
	ImVec2 size = ImGui::GetWindowSize();

	ImGui::Columns(2, nullptr, false);
	ImGui::SetColumnWidth(0, size.x / 2.f);
	ImGui::SetColumnWidth(1, size.x / 2.f);

	static int valPerRowQueued = 16;
	static int valPerRow = valPerRowQueued;
	ImGui::SetNextItemWidth(100.f);
	ImGui::InputInt("Values Per Row", &valPerRowQueued, 1, 2);
	if (valPerRowQueued > 32) valPerRowQueued = 32;
	ImGui::NextColumn();

	static int dispRowsQueued = 50;
	static int dispRows = dispRowsQueued;
	ImGui::SetNextItemWidth(100.f);
	ImGui::InputInt("Rows", &dispRowsQueued, 1, 8);
	if (dispRowsQueued > 256) dispRowsQueued = 256;
	ImGui::Columns(1);

	static uint16_t adr = 0x0000;
	static uint16_t adrUpdated = 0x0000;
	char buffer[5];
	std::snprintf(buffer, sizeof(buffer), "%X", adr);
	ImGui::SetNextItemWidth(200.f);
	if (ImGui::InputText("Adress", buffer, sizeof(buffer), ImGuiInputTextFlags_CharsHexadecimal | ImGuiInputTextFlags_CharsUppercase))
	{
		adr = std::strtol(buffer, nullptr, 16);
	}
	if (ImGui::Button("Search")) {
		adrUpdated = adr;
		dispRows = dispRowsQueued;
		valPerRow = valPerRowQueued;
		updateRamBuffers(adrUpdated, dispRows, valPerRow);
	}
	ImGui::SameLine();
	if (ImGui::Button("Refresh")) {
		dispRows = dispRowsQueued;
		valPerRow = valPerRowQueued;
		updateRamBuffers(adrUpdated, dispRows, valPerRow);
	}

	ImGui::Separator();

	static bool selected;
	bool popStyle = false;

	constexpr float cellWidth = 20.f;
	constexpr float valBrightness = 0.7f;

	if (init) {
		updateRamBuffers(adrUpdated, dispRows, valPerRow);
	}

	for (int y = -1; y < dispRows; y++)
	{
		for (int x = 0; x < valPerRow + 1; x++)
		{
			float thisCellWidth = x == 0 ? 50.f : cellWidth;
			std::string label = "??";

			if (y == -1) {
				if (x == 0) label = " ";
				else label = "+" + std::to_string(x - 1);
				popStyle = false;
			}
			else if (x == 0) { // adrUpdated
				label = "0x" + int16Tohex((adr + y * valPerRow));
				popStyle = false;
			}
			else {
				size_t adrWordRelToBuf = x - 1 + y * valPerRow;
				if (adrWordRelToBuf >= m_RamBufferSize && m_isRamBufferFilled) {
					ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.87f, 0.54f, 0.05f, 1.0f));
				}
				else if (m_isRamBufferFilled && m_RamBufferUpdated[adrWordRelToBuf] != m_RamBuffer[adrWordRelToBuf]) {
					ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.9, 0.1, 0.1, 1.0f));
				}
				else {
					ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(valBrightness, valBrightness, valBrightness, 1.0f));
				}
				label = int8ToHex(m_RamBufferUpdated[adrWordRelToBuf]);

				popStyle = true;
			}

			if (x > 0) ImGui::SameLine();
			ImGui::Selectable(label.c_str(), &selected, ImGuiSelectableFlags_None, ImVec2(thisCellWidth, 15.f));

			if (popStyle) {
				ImGui::PopStyleColor();
			}
		}
	}

	ImGui::End();

	reinit = false;
	init = false;
}

const std::string e8080::Emulator8080::getAsssemblerLine(unsigned char opcode, size_t& ptr)
{
	unsigned short progPtr = (unsigned short)ptr;
	std::stringstream line;

	// Note: ftm::format takes in the last argmument first!
	std::string mnemonic;
	int params = 0;

	switch (opcode) {
		// Increment Decrement
	case 0x00: mnemonic = "NOP"; break;
	case 0x01: mnemonic = "LXI B,"; params = 2; break;
	case 0x02: mnemonic = "STAX B"; break;
	case 0x03: mnemonic = "INX B"; break;
	case 0x04: mnemonic = "INR B"; break;
	case 0x05: mnemonic = "DCR B"; break;
	case 0x06: mnemonic = "MVI B,"; params = 1; break;
	case 0x07: mnemonic = "RLC"; break;
	case 0x09: mnemonic = "DAD B"; break;
	case 0x0a: mnemonic = "LDAX B"; break;
	case 0x0b: mnemonic = "DCX B"; break;
	case 0x0c: mnemonic = "INC C"; break;
	case 0x0d: mnemonic = "DCR C"; break;
	case 0x0e: mnemonic = "MVI C,"; params = 1; break;
	case 0x0f: mnemonic = "RRC"; break;
	case 0x11: mnemonic = "LXI D,"; params = 2; break;
	case 0x12: mnemonic = "STAX D"; break;
	case 0x13: mnemonic = "INX D"; break;
	case 0x14: mnemonic = "INR D"; break;
	case 0x15: mnemonic = "DCR D"; break;
	case 0x16: mnemonic = "MVI D,"; params = 1; break;
	case 0x17: mnemonic = "RAL"; break;
	case 0x19: mnemonic = "DAD D"; break;
	case 0x1a: mnemonic = "LDAX D"; break;
	case 0x1b: mnemonic = "DCX D"; break;
	case 0x1c: mnemonic = "INR E"; break;
	case 0x1d: mnemonic = "DCR E"; break;
	case 0x1e: mnemonic = "MVI E,"; params = 1; break;
	case 0x1f: mnemonic = "RAR"; break;
	case 0x20: mnemonic = "RIM"; break;
	case 0x21: mnemonic = "LXI H,"; params = 2; break;
	case 0x22: mnemonic = "SHLD"; params = 2; break;
	case 0x23: mnemonic = "INX H"; break;
	case 0x24: mnemonic = "INR H"; break;
	case 0x25: mnemonic = "DCR H"; break;
	case 0x26: mnemonic = "MVI H,"; params = 1; break;
	case 0x27: mnemonic = "DAA"; break;
	case 0x29: mnemonic = "DAD H"; break;
	case 0x2a: mnemonic = "LHLD"; params = 2; break;
	case 0x2b: mnemonic = "DCX H"; break;
	case 0x2c: mnemonic = "INR L"; break;
	case 0x2d: mnemonic = "DCR L"; break;
	case 0x2e: mnemonic = "MVI L,"; params = 1; break;
	case 0x2f: mnemonic = "CMA"; break;
	case 0x30: mnemonic = "SIM"; break;
	case 0x31: mnemonic = "LXI SP,"; params = 2; break;
	case 0x32: mnemonic = "STA"; params = 2; break;
	case 0x33: mnemonic = "INX SP"; break;
	case 0x34: mnemonic = "INR M"; break;
	case 0x35: mnemonic = "DCR M"; break;
	case 0x36: mnemonic = "MVI M,"; params = 1; break;
	case 0x37: mnemonic = "STC"; break;
	case 0x39: mnemonic = "DAD SP"; break;
	case 0x3a: mnemonic = "LDA"; params = 2; break;
	case 0x3b: mnemonic = "DCS SP"; break;
	case 0x3c: mnemonic = "INR A"; break;
	case 0x3d: mnemonic = "DCR A"; break;
	case 0x3e: mnemonic = "MVI A,"; params = 1; break;
	case 0x3f: mnemonic = "CMC"; break;

		// Move Instructions
	case 0x40: mnemonic = "MOV B, B"; break;
	case 0x41: mnemonic = "MOV B, C"; break;
	case 0x42: mnemonic = "MOV B, D"; break;
	case 0x43: mnemonic = "MOV B, E"; break;
	case 0x44: mnemonic = "MOV B, H"; break;
	case 0x45: mnemonic = "MOV B, L"; break;
	case 0x46: mnemonic = "MOV B, M"; break;
	case 0x47: mnemonic = "MOV B, A"; break;
	case 0x48: mnemonic = "MOV C, B"; break;
	case 0x49: mnemonic = "MOV C, C"; break;
	case 0x4a: mnemonic = "MOV C, D"; break;
	case 0x4b: mnemonic = "MOV C, E"; break;
	case 0x4c: mnemonic = "MOV C, H"; break;
	case 0x4d: mnemonic = "MOV C, L"; break;
	case 0x4e: mnemonic = "MOV C, M"; break;
	case 0x4f: mnemonic = "MOV C, A"; break;
	case 0x50: mnemonic = "MOV D, B"; break;
	case 0x51: mnemonic = "MOV D, C"; break;
	case 0x52: mnemonic = "MOV D, D"; break;
	case 0x53: mnemonic = "MOV D, E"; break;
	case 0x54: mnemonic = "MOV D, H"; break;
	case 0x55: mnemonic = "MOV D, L"; break;
	case 0x56: mnemonic = "MOV D, M"; break;
	case 0x57: mnemonic = "MOV D, A"; break;
	case 0x58: mnemonic = "MOV E, B"; break;
	case 0x59: mnemonic = "MOV E, C"; break;
	case 0x5a: mnemonic = "MOV E, D"; break;
	case 0x5b: mnemonic = "MOV E, E"; break;
	case 0x5c: mnemonic = "MOV E, H"; break;
	case 0x5d: mnemonic = "MOV E, L"; break;
	case 0x5e: mnemonic = "MOV E, M"; break;
	case 0x5f: mnemonic = "MOV E, A"; break;
	case 0x60: mnemonic = "MOV H, B"; break;
	case 0x61: mnemonic = "MOV H, C"; break;
	case 0x62: mnemonic = "MOV H, D"; break;
	case 0x63: mnemonic = "MOV H, E"; break;
	case 0x64: mnemonic = "MOV H, H"; break;
	case 0x65: mnemonic = "MOV H, L"; break;
	case 0x66: mnemonic = "MOV H, M"; break;
	case 0x67: mnemonic = "MOV H, A"; break;
	case 0x68: mnemonic = "MOV L, B"; break;
	case 0x69: mnemonic = "MOV L, C"; break;
	case 0x6a: mnemonic = "MOV L, D"; break;
	case 0x6b: mnemonic = "MOV L, E"; break;
	case 0x6c: mnemonic = "MOV L, H"; break;
	case 0x6d: mnemonic = "MOV L, L"; break;
	case 0x6e: mnemonic = "MOV L, M"; break;
	case 0x6f: mnemonic = "MOV L, B"; break;
	case 0x70: mnemonic = "MOV M, B"; break;
	case 0x71: mnemonic = "MOV M, C"; break;
	case 0x72: mnemonic = "MOV M, D"; break;
	case 0x73: mnemonic = "MOV M, E"; break;
	case 0x74: mnemonic = "MOV M, H"; break;
	case 0x75: mnemonic = "MOV M, L"; break;
	case 0x76: mnemonic = "HLT"; break;
	case 0x77: mnemonic = "MOV M, A"; break;
	case 0x78: mnemonic = "MOV A, B"; break;
	case 0x79: mnemonic = "MOV A, C"; break;
	case 0x7a: mnemonic = "MOV A, D"; break;
	case 0x7b: mnemonic = "MOV A, E"; break;
	case 0x7c: mnemonic = "MOV A, H"; break;
	case 0x7d: mnemonic = "MOV A, L"; break;
	case 0x7e: mnemonic = "MOV A, M"; break;
	case 0x7f: mnemonic = "MOV A, A"; break;

		// Arithmetic Instructions
	case 0x80: mnemonic = "ADD B"; break;
	case 0x81: mnemonic = "ADD C"; break;
	case 0x82: mnemonic = "ADD D"; break;
	case 0x83: mnemonic = "ADD E"; break;
	case 0x84: mnemonic = "ADD H"; break;
	case 0x85: mnemonic = "ADD L"; break;
	case 0x86: mnemonic = "ADD M"; break;
	case 0x87: mnemonic = "ADD A"; break;
	case 0x88: mnemonic = "ADC B"; break;
	case 0x89: mnemonic = "ADC C"; break;
	case 0x8a: mnemonic = "ADC D"; break;
	case 0x8b: mnemonic = "ADC E"; break;
	case 0x8c: mnemonic = "ADC H"; break;
	case 0x8d: mnemonic = "ADC L"; break;
	case 0x8e: mnemonic = "ADC M"; break;
	case 0x8f: mnemonic = "ADC A"; break;
	case 0x90: mnemonic = "SUB B"; break;
	case 0x91: mnemonic = "SUB C"; break;
	case 0x92: mnemonic = "SUB D"; break;
	case 0x93: mnemonic = "SUB E"; break;
	case 0x94: mnemonic = "SUB H"; break;
	case 0x95: mnemonic = "SUB L"; break;
	case 0x96: mnemonic = "SUB M"; break;
	case 0x97: mnemonic = "SUB A"; break;
	case 0x98: mnemonic = "SBB B"; break;
	case 0x99: mnemonic = "SBB C"; break;
	case 0x9a: mnemonic = "SBB D"; break;
	case 0x9b: mnemonic = "SBB E"; break;
	case 0x9c: mnemonic = "SBB H"; break;
	case 0x9d: mnemonic = "SBB L"; break;
	case 0x9e: mnemonic = "SBB M"; break;
	case 0x9f: mnemonic = "SBB A"; break;
	case 0xa0: mnemonic = "ANA B"; break;
	case 0xa1: mnemonic = "ANA C"; break;
	case 0xa2: mnemonic = "ANA D"; break;
	case 0xa3: mnemonic = "ANA E"; break;
	case 0xa4: mnemonic = "ANA H"; break;
	case 0xa5: mnemonic = "ANA L"; break;
	case 0xa6: mnemonic = "ANA M"; break;
	case 0xa7: mnemonic = "ANA A"; break;
	case 0xa8: mnemonic = "XRA B"; break;
	case 0xa9: mnemonic = "XRA C"; break;
	case 0xaa: mnemonic = "XRA D"; break;
	case 0xab: mnemonic = "XRA E"; break;
	case 0xac: mnemonic = "XRA H"; break;
	case 0xad: mnemonic = "XRA L"; break;
	case 0xae: mnemonic = "XRA M"; break;
	case 0xaf: mnemonic = "XRA A"; break;
	case 0xb0: mnemonic = "ORA B"; break;
	case 0xb1: mnemonic = "ORA C"; break;
	case 0xb2: mnemonic = "ORA D"; break;
	case 0xb3: mnemonic = "ORA E"; break;
	case 0xb4: mnemonic = "ORA H"; break;
	case 0xb5: mnemonic = "ORA L"; break;
	case 0xb6: mnemonic = "ORA M"; break;
	case 0xb7: mnemonic = "ORA A"; break;
	case 0xb8: mnemonic = "CMP B"; break;
	case 0xb9: mnemonic = "CMP C"; break;
	case 0xba: mnemonic = "CMP D"; break;
	case 0xbb: mnemonic = "CMP E"; break;
	case 0xbc: mnemonic = "CMP H"; break;
	case 0xbd: mnemonic = "CMP L"; break;
	case 0xbe: mnemonic = "CMP M"; break;
	case 0xbf: mnemonic = "CMP A"; break;

		// Controll-flow Instructions
	case 0xc0: mnemonic = "RNZ"; break;
	case 0xc1: mnemonic = "POP B"; break;
	case 0xc2: mnemonic = "JNZ"; params = 2; break;
	case 0xc3: mnemonic = "JMP"; params = 2; break;
	case 0xc4: mnemonic = "CNZ"; params = 2; break;
	case 0xc5: mnemonic = "PUSH B"; break;
	case 0xc6: mnemonic = "ADI"; params = 1; break;
	case 0xc7: mnemonic = "RST 0"; break;
	case 0xc8: mnemonic = "RZ"; break;
	case 0xc9: mnemonic = "RET"; break;
	case 0xca: mnemonic = "JZ"; params = 2; break;
	case 0xcc: mnemonic = "CZ"; params = 2; break;
	case 0xcd: mnemonic = "Call"; params = 2; break;
	case 0xce: mnemonic = "ACI"; params = 1; break;
	case 0xcf: mnemonic = "RST 1"; break;
	case 0xd0: mnemonic = "RNC"; break;
	case 0xd1: mnemonic = "POP D"; break;
	case 0xd2: mnemonic = "JNC"; params = 2; break;
	case 0xd3: mnemonic = "OUT"; params = 1; break;
	case 0xd4: mnemonic = "CNC"; params = 2; break;
	case 0xd5: mnemonic = "PUSH D"; break;
	case 0xd6: mnemonic = "SUI"; params = 1; break;
	case 0xd7: mnemonic = "RST 2"; break;
	case 0xd8: mnemonic = "RC"; break;
	case 0xda: mnemonic = "JC"; params = 2; break;
	case 0xdb: mnemonic = "IN"; params = 1; break;
	case 0xdc: mnemonic = "CC"; params = 2; break;
	case 0xde: mnemonic = "SBI"; params = 1; break;
	case 0xdf: mnemonic = "RST 3"; break;
	case 0xe0: mnemonic = "PRO"; break;
	case 0xe1: mnemonic = "POP H"; break;
	case 0xe2: mnemonic = "JPO"; params = 2; break;
	case 0xe3: mnemonic = "XTHL"; break;
	case 0xe4: mnemonic = "CPO"; params = 2; break;
	case 0xe5: mnemonic = "PUSH H"; break;
	case 0xe6: mnemonic = "ANI"; params = 1; break;
	case 0xe7: mnemonic = "RST 4"; break;
	case 0xe8: mnemonic = "RPE"; break;
	case 0xe9: mnemonic = "PCHL"; break;
	case 0xea: mnemonic = "JPE"; params = 2; break;
	case 0xeb: mnemonic = "XCHG"; break;
	case 0xec: mnemonic = "CPE"; params = 2; break;
	case 0xee: mnemonic = "XRI"; params = 1; break;
	case 0xef: mnemonic = "RST 5"; break;
	case 0xf0: mnemonic = "RP"; break;
	case 0xf1: mnemonic = "POP PSW"; break;
	case 0xf2: mnemonic = "JP"; params = 2; break;
	case 0xf3: mnemonic = "DI"; break;
	case 0xf4: mnemonic = "CP"; params = 2; break;
	case 0xf5: mnemonic = "PUSH PSW"; break;
	case 0xf6: mnemonic = "ORI"; params = 1; break;
	case 0xf7: mnemonic = "RST 6"; break;
	case 0xf8: mnemonic = "RM"; break;
	case 0xf9: mnemonic = "SPHL"; break;
	case 0xfa: mnemonic = "JM"; params = 2; break;
	case 0xfb: mnemonic = "EI"; break;
	case 0xfc: mnemonic = "CM"; params = 2; break;
	case 0xfe: mnemonic = "CP"; params = 1; break;
	case 0xff: mnemonic = "RST 7"; break;

	default: mnemonic = "NOP";
	}

	std::string binary;
	switch (params)
	{
	case 1:
		mnemonic = fmt::format("{} #{}h", mnemonic, bufferBstrH(++ptr));
		binary = fmt::format("{} {}", chToHex(opcode), bufferBstrH(ptr));
		break;
	case 2:
		mnemonic = fmt::format("{} #{}{}h", mnemonic, bufferBstrH(++ptr), bufferBstrH(++ptr));
		binary = fmt::format("{} {} {}", chToHex(opcode), bufferBstrH(ptr - 1), bufferBstrH(ptr));
		break;
	default:
		binary = chToHex(opcode);
		break;
	}

	std::string comment = fmt::format("; [0x{}]   {}\n", int16Tohex(progPtr), binary);

	line << std::left << std::setw(30) << mnemonic << comment;
	return line.str();
}

bool e8080::Emulator8080::executeInstruction(unsigned char opcode)
{
	int cycles = 0;

	uint16_t res, adr;
	uint8_t psw, temp;
	bool lsb, msb;

	switch (opcode) {
		// Increment Decrement
	case 0x00: cycles = 4; break;
	case 0x01: cycles = 10;
		m_State.C = m_RomBuffer[++m_State.PC];
		m_State.B = m_RomBuffer[++m_State.PC];
		break;
	case 0x02: cycles = 7;
		m_State.mem[regTo16(m_State.B, m_State.C)] = m_State.A;
		break;
	case 0x03: cycles = 5;
		incAdrReg(m_State.B, m_State.C);
		break;
	case 0x04: cycles = 5;
		incReg(m_State.B);
		break;
	case 0x05: cycles = 5;
		decrReg(m_State.B);
		break;
	case 0x06: cycles = 7;
		m_State.B = m_RomBuffer[++m_State.PC];
		break;
	case 0x07: cycles = 4;
		shiftLeft(m_State.A, 1);
		break;
	case 0x09: cycles = 10;
		res = add16(regTo16(m_State.H, m_State.L), regTo16(m_State.B, m_State.C));
		m_State.H = getHigherNib(res);
		m_State.L = getHigherNib(res);
		break;
	case 0x0a: cycles = 7;
		m_State.A = m_State.mem[regTo16(m_State.B, m_State.C)];
		break;
	case 0x0b: cycles = 5;
		decAdrReg(m_State.B, m_State.C);
		break;
	case 0x0c: cycles = 5;
		incReg(m_State.C);
		break;
	case 0x0d: cycles = 5;
		decrReg(m_State.C);
		break;
	case 0x0e: cycles = 7;
		m_State.C = m_RomBuffer[++m_State.PC];
		break;
	case 0x0f: cycles = 4;
		shiftRight(m_State.A, 1);
		break;
	case 0x11: cycles = 10;
		m_State.E = m_RomBuffer[++m_State.PC];
		m_State.D = m_RomBuffer[++m_State.PC];
		break;
	case 0x12: cycles = 7;
		m_State.mem[regTo16(m_State.D, m_State.E)] = m_State.A;
		break;
	case 0x13: cycles = 5;
		incAdrReg(m_State.D, m_State.E);
		break;
	case 0x14: cycles = 5;
		incReg(m_State.D);
		break;
	case 0x15: cycles = 5;
		decrReg(m_State.C);
		break;
	case 0x16: cycles = 7;
		m_State.D = m_RomBuffer[++m_State.PC];
		break;
	case 0x17: cycles = 4;							// TODO: Must be tested!!!
		msb = (m_State.A & 0x80) != 0;
		m_State.A <<= 1;
		m_State.A |= m_State.flags.cy;
		m_State.flags.cy = msb ? 1 : 0;
		break;
	case 0x19: cycles = 10;
		res = add16(regTo16(m_State.H, m_State.L), regTo16(m_State.D, m_State.E));
		m_State.H = getHigherNib(res);
		m_State.L = getHigherNib(res);
		break;
	case 0x1a: cycles = 7;
		m_State.A = m_State.mem[regTo16(m_State.D, m_State.E)];
		break;
	case 0x1b: cycles = 5;
		decAdrReg(m_State.D, m_State.E);
		break;
	case 0x1c: cycles = 5;
		incReg(m_State.E);
		break;
	case 0x1d: cycles = 5;
		decrReg(m_State.E);
		break;
	case 0x1e: cycles = 7;
		m_State.E = m_RomBuffer[++m_State.PC];
		break;
	case 0x1f: cycles = 4;							// TODO: Must be tested!!!
		lsb = (m_State.A & 0x01) != 0;
		m_State.A |= (m_State.flags.cy << 7);
		m_State.flags.cy = lsb ? 1 : 0;
		break;
	case 0x20: cycles = 4; break;
	case 0x21: cycles = 10;
		m_State.L = m_RomBuffer[++m_State.PC];
		m_State.H = m_RomBuffer[++m_State.PC];
		break;
	case 0x22: cycles = 16;
		adr = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		m_State.PC += 2;
		m_State.mem[adr] = m_State.L;
		m_State.mem[adr + 1] = m_State.H;
		break;
	case 0x23: cycles = 5;
		incAdrReg(m_State.H, m_State.L);
		break;
	case 0x24: cycles = 5;
		incReg(m_State.H);
		break;
	case 0x25: cycles = 5;
		decrReg(m_State.H);
		break;
	case 0x26: cycles = 7;
		m_State.H = m_RomBuffer[++m_State.PC];
		break;
	case 0x27: cycles = 4; break;
	case 0x29: cycles = 10;
		res = add16(regTo16(m_State.H, m_State.L), regTo16(m_State.H, m_State.L));
		m_State.H = getHigherNib(res);
		m_State.L = getHigherNib(res);
		break;
	case 0x2a: cycles = 16;
		adr = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		m_State.PC += 2;
		m_State.L = m_State.mem[adr];
		m_State.H = m_State.mem[adr + 1];
		break;
	case 0x2b: cycles = 5;
		decAdrReg(m_State.H, m_State.L);
		break;
	case 0x2c: cycles = 5;
		incReg(m_State.L);
		break;
	case 0x2d: cycles = 5;
		decrReg(m_State.L);
		break;
	case 0x2e: cycles = 7;
		m_State.L = m_RomBuffer[++m_State.PC];
		break;
	case 0x2f: cycles = 4;
		m_State.A = ~m_State.A;
		break;
	case 0x30: cycles = 4; break;
	case 0x31: cycles = 10;
		m_State.SP = regTo16(m_State.mem[m_State.PC + 2], m_State.mem[m_State.PC + 1]);
		m_State.PC += 2;
		break;
	case 0x32: cycles = 13;
		adr = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		m_State.PC += 2;
		m_State.mem[adr] = m_State.A;
		break;
	case 0x33: cycles = 5;
		m_State.SP++;
		break;
	case 0x34: cycles = 10;
		adr = regTo16(m_State.H, m_State.L);
		incReg(m_State.mem[adr]);
		break;
	case 0x35: cycles = 10;
		adr = regTo16(m_State.H, m_State.L);
		decrReg(m_State.mem[adr]);
		break;
	case 0x36: cycles = 10;
		adr = regTo16(m_State.H, m_State.L);
		m_State.mem[adr] = m_RomBuffer[++m_State.PC];
		break;
	case 0x37: cycles = 4;
		m_State.flags.cy = 1;
		break;
	case 0x39: cycles = 10;
		res = add16(regTo16(m_State.H, m_State.L), m_State.SP);
		m_State.H = getHigherNib(res);
		m_State.L = getLowerNib(res);
		break;
	case 0x3a: cycles = 13;
		adr = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		m_State.PC += 2;
		m_State.A = m_State.mem[adr];
		break;
	case 0x3b: cycles = 5;
		m_State.SP--;
		break;
	case 0x3c: cycles = 5;
		incReg(m_State.A);
		break;
	case 0x3d: cycles = 5;
		decrReg(m_State.A);
		break;
	case 0x3e: cycles = 7;
		m_State.A = m_RomBuffer[++m_State.PC];
		break;
	case 0x3f: cycles = 4;
		m_State.flags.cy = ~m_State.flags.cy;
		break;

	case 0x40: cycles = 4;
		m_State.B = m_State.B;
		break;
	case 0x41: cycles = 4;
		m_State.B = m_State.C;
		break;
	case 0x42: cycles = 4;
		m_State.B = m_State.D;
		break;
	case 0x43: cycles = 4;
		m_State.B = m_State.E;
		break;
	case 0x44: cycles = 4;
		m_State.B = m_State.H;
		break;
	case 0x45: cycles = 4;
		m_State.B = m_State.L;
		break;
	case 0x46: cycles = 7;
		m_State.B = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x47: cycles = 4;
		m_State.B = m_State.A;
		break;
	case 0x48: cycles = 4;
		m_State.C = m_State.B;
		break;
	case 0x49: cycles = 4;
		m_State.C = m_State.C;
		break;
	case 0x4a: cycles = 4;
		m_State.C = m_State.D;
		break;
	case 0x4b: cycles = 4;
		m_State.C = m_State.E;
		break;
	case 0x4c: cycles = 4;
		m_State.C = m_State.H;
		break;
	case 0x4d: cycles = 4;
		m_State.C = m_State.L;
		break;
	case 0x4e: cycles = 7;
		m_State.C = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x4f: cycles = 4;
		m_State.C = m_State.A;
		break;
	case 0x50: cycles = 4;
		m_State.D = m_State.B;
		break;
	case 0x51: cycles = 4;
		m_State.D = m_State.C;
		break;
	case 0x52: cycles = 4;
		m_State.D = m_State.D;
		break;
	case 0x53: cycles = 4;
		m_State.D = m_State.E;
		break;
	case 0x54: cycles = 4;
		m_State.D = m_State.H;
		break;
	case 0x55: cycles = 4;
		m_State.D = m_State.L;
		break;
	case 0x56: cycles = 7;
		m_State.D = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x57: cycles = 4;
		m_State.D = m_State.A;
		break;
	case 0x58: cycles = 4;
		m_State.E = m_State.B;
		break;
	case 0x59: cycles = 4;
		m_State.E = m_State.C;
		break;
	case 0x5a: cycles = 4;
		m_State.E = m_State.D;
		break;
	case 0x5b: cycles = 4;
		m_State.E = m_State.E;
		break;
	case 0x5c: cycles = 4;
		m_State.E = m_State.H;
		break;
	case 0x5d: cycles = 4;
		m_State.E = m_State.L;
		break;
	case 0x5e: cycles = 7;
		m_State.E = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x5f: cycles = 4;
		m_State.E = m_State.A;
		break;
	case 0x60: cycles = 4;
		m_State.H = m_State.B;
		break;
	case 0x61: cycles = 4;
		m_State.H = m_State.C;
		break;
	case 0x62: cycles = 4;
		m_State.H = m_State.D;
		break;
	case 0x63: cycles = 4;
		m_State.H = m_State.E;
		break;
	case 0x64: cycles = 4;
		m_State.H = m_State.H;
		break;
	case 0x65: cycles = 4;
		m_State.H = m_State.L;
		break;
	case 0x66: cycles = 7;
		m_State.H = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x67: cycles = 4;
		m_State.H = m_State.A;
		break;
	case 0x68: cycles = 4;
		m_State.L = m_State.B;
		break;
	case 0x69: cycles = 4;
		m_State.L = m_State.C;
		break;
	case 0x6a: cycles = 4;
		m_State.L = m_State.D;
		break;
	case 0x6b: cycles = 4;
		m_State.L = m_State.E;
		break;
	case 0x6c: cycles = 4;
		m_State.L = m_State.H;
		break;
	case 0x6d: cycles = 4;
		m_State.L = m_State.L;
		break;
	case 0x6e: cycles = 7;
		m_State.L = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x6f: cycles = 4;
		m_State.L = m_State.A;
		break;
	case 0x70: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.B;
		break;
	case 0x71: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.C;
		break;
	case 0x72: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.D;
		break;
	case 0x73: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.E;
		break;
	case 0x74: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.H;
		break;
	case 0x75: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.L;
		break;
	case 0x76: cycles = 7; break;
	case 0x77: cycles = 7;
		m_State.mem[regTo16(m_State.H, m_State.L)] = m_State.A;
		break;
	case 0x78: cycles = 4;
		m_State.A = m_State.B;
		break;
	case 0x79: cycles = 4;
		m_State.A = m_State.C;
		break;
	case 0x7a: cycles = 4;
		m_State.A = m_State.D;
		break;
	case 0x7b: cycles = 4;
		m_State.A = m_State.E;
		break;
	case 0x7c: cycles = 4;
		m_State.A = m_State.H;
		break;
	case 0x7d: cycles = 4;
		m_State.A = m_State.L;
		break;
	case 0x7e: cycles = 7;
		m_State.A = m_State.mem[regTo16(m_State.H, m_State.L)];
		break;
	case 0x7f: cycles = 4;
		m_State.A = m_State.A;
		break;

	case 0x80: cycles = 4;
		addToAcc(m_State.B);
		break;
	case 0x81: cycles = 4;
		addToAcc(m_State.C);
		break;
	case 0x82: cycles = 4;
		addToAcc(m_State.D);
		break;
	case 0x83: cycles = 4;
		addToAcc(m_State.E);
		break;
	case 0x84: cycles = 4;
		addToAcc(m_State.H);
		break;
	case 0x85: cycles = 4;
		addToAcc(m_State.L);
		break;
	case 0x86: cycles = 7;
		addToAcc(m_State.mem[regTo16(m_State.H, m_State.L)]);
		break;
	case 0x87: cycles = 4;
		addToAcc(m_State.A);
		break;
	case 0x88: cycles = 4;
		addToAccBF(m_State.B, m_State.flags.cy);
		break;
	case 0x89: cycles = 4;
		addToAccBF(m_State.C, m_State.flags.cy);
		break;
	case 0x8a: cycles = 4;
		addToAccBF(m_State.D, m_State.flags.cy);
		break;
	case 0x8b: cycles = 4;
		addToAccBF(m_State.E, m_State.flags.cy);
		break;
	case 0x8c: cycles = 4;
		addToAccBF(m_State.H, m_State.flags.cy);
		break;
	case 0x8d: cycles = 4;
		addToAccBF(m_State.L, m_State.flags.cy);
		break;
	case 0x8e: cycles = 7;
		addToAccBF(m_State.mem[regTo16(m_State.H, m_State.L)], m_State.flags.cy);
		break;
	case 0x8f: cycles = 4;
		addToAccBF(m_State.A, m_State.flags.cy);
		break;
	case 0x90: cycles = 4;
		subFromAcc(m_State.B);
		break;
	case 0x91: cycles = 4;
		subFromAcc(m_State.C);
		break;
	case 0x92: cycles = 4;
		subFromAcc(m_State.D);
		break;
	case 0x93: cycles = 4;
		subFromAcc(m_State.E);
		break;
	case 0x94: cycles = 4;
		subFromAcc(m_State.H);
		break;
	case 0x95: cycles = 4;
		subFromAcc(m_State.L);
		break;
	case 0x96: cycles = 7;
		subFromAcc(m_State.mem[regTo16(m_State.H, m_State.L)]);
		break;
	case 0x97: cycles = 4;
		subFromAcc(m_State.A);
		break;
	case 0x98: cycles = 4;
		subFromAccBF(m_State.B, m_State.flags.cy);
		break;
	case 0x99: cycles = 4;
		subFromAccBF(m_State.C, m_State.flags.cy);
		break;
	case 0x9a: cycles = 4;
		subFromAccBF(m_State.D, m_State.flags.cy);
		break;
	case 0x9b: cycles = 4;
		subFromAccBF(m_State.E, m_State.flags.cy);
		break;
	case 0x9c: cycles = 4;
		subFromAccBF(m_State.H, m_State.flags.cy);
		break;
	case 0x9d: cycles = 4;
		subFromAccBF(m_State.L, m_State.flags.cy);
		break;
	case 0x9e: cycles = 7;
		subFromAccBF(m_State.mem[regTo16(m_State.H, m_State.L)], m_State.flags.cy);
		break;
	case 0x9f: cycles = 4;
		subFromAccBF(m_State.A, m_State.flags.cy);
		break;
	case 0xa0: cycles = 4;
		bitAndAcc(m_State.B);
		break;
	case 0xa1: cycles = 4;
		bitAndAcc(m_State.C);
		break;
	case 0xa2: cycles = 4;
		bitAndAcc(m_State.D);
		break;
	case 0xa3: cycles = 4;
		bitAndAcc(m_State.E);
		break;
	case 0xa4: cycles = 4;
		bitAndAcc(m_State.H);
		break;
	case 0xa5: cycles = 4;
		bitAndAcc(m_State.L);
		break;
	case 0xa6: cycles = 7;
		bitAndAcc(m_State.mem[regTo16(m_State.H, m_State.L)]);
		break;
	case 0xa7: cycles = 4;
		bitAndAcc(m_State.A);
		break;
	case 0xa8: cycles = 4;
		bitXorAcc(m_State.B);
		break;
	case 0xa9: cycles = 4;
		bitXorAcc(m_State.C);
		break;
	case 0xaa: cycles = 4;
		bitXorAcc(m_State.D);
		break;
	case 0xab: cycles = 4;
		bitXorAcc(m_State.E);
		break;
	case 0xac: cycles = 4;
		bitXorAcc(m_State.H);
		break;
	case 0xad: cycles = 4;
		bitXorAcc(m_State.L);
		break;
	case 0xae: cycles = 7;
		bitXorAcc(m_State.mem[regTo16(m_State.H, m_State.L)]);
		break;
	case 0xaf: cycles = 4;
		bitXorAcc(m_State.A);
		break;
	case 0xb0: cycles = 4;
		bitOrAcc(m_State.B);
		break;
	case 0xb1: cycles = 4;
		bitOrAcc(m_State.C);
		break;
	case 0xb2: cycles = 4;
		bitOrAcc(m_State.D);
		break;
	case 0xb3: cycles = 4;
		bitOrAcc(m_State.E);
		break;
	case 0xb4: cycles = 4;
		bitOrAcc(m_State.H);
		break;
	case 0xb5: cycles = 4;
		bitOrAcc(m_State.L);
		break;
	case 0xb6: cycles = 7;
		bitOrAcc(m_State.mem[regTo16(m_State.H, m_State.L)]);
		break;
	case 0xb7: cycles = 4;
		bitOrAcc(m_State.A);
		break;
	case 0xb8: cycles = 4;
		subFromAcc(m_State.B, 0, true);
		break;
	case 0xb9: cycles = 4;
		subFromAcc(m_State.C, 0, true);
		break;
	case 0xba: cycles = 4;
		subFromAcc(m_State.D, 0, true);
		break;
	case 0xbb: cycles = 4;
		subFromAcc(m_State.E, 0, true);
		break;
	case 0xbc: cycles = 4;
		subFromAcc(m_State.H, 0, true);
		break;
	case 0xbd: cycles = 4;
		subFromAcc(m_State.L, 0, true);
		break;
	case 0xbe: cycles = 7;
		subFromAcc(m_State.mem[regTo16(m_State.H, m_State.L)], 0, true);
		break;
	case 0xbf: cycles = 4;
		subFromAcc(m_State.A, 0, true);
		break;

	case 0xc0:
		if (!m_State.flags.z) {
			ret();
			cycles = 11;
		}
		cycles = 5;
		break;
	case 0xc1: cycles = 10;				// Check for right order
		m_State.C = popStack();
		m_State.B = popStack();
		break;
	case 0xc2: cycles = 10;
		if (!m_State.flags.z) {
			call();
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xc3: cycles = 10;
		m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		break;
	case 0xc4:
		if (!m_State.flags.z) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xc5: cycles = 11;
		pushStack(m_State.C);
		pushStack(m_State.B);
		break;
	case 0xc6: cycles = 7;
		addToAcc(m_RomBuffer[++m_State.PC]);
		break;
	case 0xc7: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0000;
		break;
	case 0xc8:
		if (m_State.flags.z) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5; break;
		}
	case 0xc9: cycles = 10;
		ret();
		break;
	case 0xca: cycles = 10;
		if (m_State.flags.z) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xcc:
		if (m_State.flags.z) {
			call();
			cycles = 11;
		}
		else {
			m_State.PC += 2;
		}
		cycles = 5;
		break;
	case 0xcd: cycles = 17;
		call();
		break;
	case 0xce: cycles = 7;
		addToAccBF(m_RomBuffer[++m_State.PC], m_State.flags.cy);
		break;
	case 0xcf: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0008;
		break;
	case 0xd0:
		if (!m_State.flags.cy) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5;
		}
		break;
	case 0xd1: cycles = 10;
		m_State.D = popStack();
		m_State.E = popStack();
		break;
	case 0xd2: cycles = 10;
		if (!m_State.flags.cy) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xd3: cycles = 10;	break;
	case 0xd4:
		if (!m_State.flags.cy) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xd5: cycles = 11;
		pushStack(m_State.E);
		pushStack(m_State.D);
		break;
	case 0xd6: cycles = 7;
		subFromAcc(m_RomBuffer[++m_State.PC]);
		break;
	case 0xd7: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0010;
		break;
	case 0xd8:
		if (m_State.flags.cy) {
			ret();
			cycles = 11;
		}
		cycles = 5;
		break;
	case 0xda: cycles = 10;
		if (m_State.flags.cy) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xdb: cycles = 10;	break;
	case 0xdc:
		if (m_State.flags.cy) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xde: cycles = 7;
		subFromAccBF(m_RomBuffer[++m_State.PC], m_State.flags.cy);
		break;
	case 0xdf: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0018;
		break;
	case 0xe0:
		if (!m_State.flags.p) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5;
		}
		break;
	case 0xe1: cycles = 10;
		m_State.H = popStack();
		m_State.L = popStack();
		break;
	case 0xe2: cycles = 10;
		if (!m_State.flags.p) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xe3: cycles = 18;							// ???
		temp = m_State.H;
		m_State.H = m_State.mem[m_State.SP];
		m_State.mem[m_State.SP] = temp;

		temp = m_State.L;
		m_State.L = m_State.mem[m_State.SP - 1];
		m_State.mem[m_State.SP - 1] = temp;
		break;
	case 0xe4:
		if (!m_State.flags.p) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xe5: cycles = 11;
		pushStack(m_State.L);
		pushStack(m_State.H);
		break;
	case 0xe6: cycles = 7;
		bitAndAcc(m_RomBuffer[++m_State.PC]);
		break;
	case 0xe7: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0020;
		break;
	case 0xe8:
		if (m_State.flags.p) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5;
		}
		break;
	case 0xe9: cycles = 5;
		m_State.PC = regTo16(m_State.H, m_State.L);
		break;
	case 0xea: cycles = 10;
		if (m_State.flags.p) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xeb: cycles = 5;
		temp = m_State.H;
		m_State.H = m_State.D;
		m_State.D = temp;

		temp = m_State.L;
		m_State.L = m_State.E;
		m_State.E = temp;
		break;
	case 0xec:
		if (m_State.flags.p) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xee: cycles = 7;
		bitXorAcc(m_RomBuffer[++m_State.PC]);
		break;
	case 0xef: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0028;
		break;
	case 0xf0:
		if (!m_State.flags.s) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5;
		}
		break;
	case 0xf1: cycles = 10;
		psw = popStack();

		m_State.flags.cy = (psw & (1 << 0)) != 0 ? 1 : 0;
		m_State.flags.p = (psw & (1 << 2)) != 0 ? 1 : 0;
		m_State.flags.ac = (psw & (1 << 4)) != 0 ? 1 : 0;
		m_State.flags.z = (psw & (1 << 6)) != 0 ? 1 : 0;
		m_State.flags.s = (psw & (1 << 7)) != 0 ? 1 : 0;

		m_State.A = popStack();
		break;
	case 0xf2: cycles = 10;
		if (m_State.flags.p) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xf3: cycles = 4; break;
	case 0xf4:
		if (!m_State.flags.s) {		// Different documentations
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
			cycles = 17;
		}
		else {
			cycles = 11;
			m_State.PC += 2;
		}
		break;
	case 0xf5: cycles = 11;
		pushStack(m_State.A);
		psw = 0x00;
		psw = m_State.flags.cy == 1 ? 0b0000001 : 0b00000000;
		psw = m_State.flags.p == 1 ? 0b0000100 : 0b00000000;
		psw = m_State.flags.ac == 1 ? 0b0010000 : 0b00000000;
		psw = m_State.flags.z == 1 ? 0b01000000 : 0b00000000;
		psw = m_State.flags.s == 1 ? 0b1000000 : 0b00000000;

		pushStack(psw);
		break;
	case 0xf6: cycles = 7;
		bitOrAcc(m_RomBuffer[++m_State.PC]);
		break;
	case 0xf7: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0030;
		break;
	case 0xf8:
		if (m_State.flags.s) {
			ret();
			cycles = 11;
		}
		else {
			cycles = 5;
		}
		break;
	case 0xf9: cycles = 5;
		m_State.SP = regTo16(m_State.H, m_State.L);
		break;
	case 0xfa: cycles = 10;
		if (m_State.flags.s) {
			m_State.PC = regTo16(m_RomBuffer[m_State.PC + 2], m_RomBuffer[m_State.PC + 1]);
		}
		else {
			m_State.PC += 2;
		}
		break;
	case 0xfb: cycles = 4; break;
	case 0xfc: cycles = 17;
		if (m_State.flags.s) {
			call();
			cycles = 11;
		}
		else {
			cycles = 5;
			m_State.PC += 2;
		}
		break;
	case 0xfd: cycles = 17;	break;
	case 0xfe: cycles = 7;
		subFromAcc(m_RomBuffer[m_State.PC], 0, true);
		break;
	case 0xff: cycles = 11;
		pushStack(getLowerNib(m_State.PC));
		pushStack(getHigherNib(m_State.PC));

		m_State.PC = 0x0038;
		break;

	default: break;
	}

	return true;
}

void e8080::Emulator8080::bitAndAcc(uint8_t val)
{
	uint8_t res = m_State.A & val;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = 0;

	m_State.A = res;
}

void e8080::Emulator8080::bitXorAcc(uint8_t val)
{
	uint8_t res = m_State.A ^ val;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = 0;

	m_State.A = res;
}

void e8080::Emulator8080::bitOrAcc(uint8_t val)
{
	uint8_t res = m_State.A | val;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = 0;

	m_State.A = res;
}

inline uint8_t e8080::Emulator8080::popStack()
{
	uint8_t ret = m_State.mem[m_State.SP];
	m_State.mem[m_State.SP] = 0x00;
	m_State.SP--;
	return ret;
}

inline void e8080::Emulator8080::pushStack(uint8_t val)
{
	m_State.SP++;
	m_State.mem[m_State.SP] = val;
}

void e8080::Emulator8080::call()
{
	uint8_t adrLo = m_RomBuffer[m_State.PC + 1];
	uint8_t adrHi = m_RomBuffer[m_State.PC + 2];

	pushStack(adrLo);
	pushStack(adrHi);

	m_State.PC = regTo16(adrHi, adrLo);
}

void e8080::Emulator8080::ret()
{
	uint8_t highNib = popStack();
	uint8_t lowNib = popStack();
	m_State.PC = regTo16(highNib, lowNib);
}

void e8080::Emulator8080::addToAcc(uint8_t valA, uint8_t valB)
{
	uint8_t res = m_State.A + valA + valB;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = m_State.A + valA + valB > 0xFF ? 1 : 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = ((m_State.A ^ valA ^ valB) & 0x10) != 0 ? 1 : 0;

	m_State.A = res;
}

void e8080::Emulator8080::subFromAcc(uint8_t valA, uint8_t valB, bool cmp)
{
	uint8_t res = m_State.A - valA - valB;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = m_State.A - valA - valB < 0 ? 1 : 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = ((m_State.A ^ valA ^ valB) & 0x10) != 0 ? 1 : 0;

	if (!cmp) m_State.A = res;
}

void e8080::Emulator8080::addToAccBF(uint8_t valA, uint8_t valB)
{
	uint8_t valBfull = valB == 1 ? 1 : 0;
	uint8_t res = m_State.A - valA - valBfull;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = m_State.A - valA - valBfull < 0 ? 1 : 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = ((m_State.A ^ valA ^ valBfull) & 0x10) != 0 ? 1 : 0;

	m_State.A = res;
}

void e8080::Emulator8080::subFromAccBF(uint8_t valA, uint8_t valB)
{
	uint8_t valBfull = valB == 1 ? 1 : 0;
	uint8_t res = m_State.A - valA - valBfull;

	m_State.flags.z = res == 0 ? 1 : 0;
	m_State.flags.s = (res & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = m_State.A - valA - valBfull < 0 ? 1 : 0;
	m_State.flags.p = checkParity(res);
	m_State.flags.ac = ((m_State.A ^ valA ^ valBfull) & 0x10) != 0 ? 1 : 0;

	m_State.A = res;
}

inline uint8_t e8080::Emulator8080::getLowerNib(uint16_t val) const
{
	val <<= 8;
	val >>= 8;
	return static_cast<uint8_t>(val);
}

inline uint8_t e8080::Emulator8080::getHigherNib(uint16_t val) const
{
	val >>= 8;
	return static_cast<uint8_t>(val);
}

inline uint8_t e8080::Emulator8080::getLowerNib(uint8_t val) const
{
	val <<= 4;
	val >>= 4;
	return static_cast<uint8_t>(val);
}

inline uint8_t e8080::Emulator8080::getHigherNib(uint8_t val) const
{
	val >>= 4;
	return static_cast<uint8_t>(val);
}

void e8080::Emulator8080::incReg(uint8_t& reg)
{
	reg++;

	m_State.flags.z = reg == 0 ? 1 : 0;
	m_State.flags.s = (reg & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = reg == 0 ? 1 : 0;
	m_State.flags.p = checkParity(reg);
	m_State.flags.ac = getLowerNib(reg) != 0 ? 1 : 0;
}

void e8080::Emulator8080::decrReg(uint8_t& reg)
{
	reg--;

	m_State.flags.z = reg == 0 ? 1 : 0;
	m_State.flags.s = (reg & (1 << 7)) != 0 ? 1 : 0;
	m_State.flags.cy = reg == 0xFF ? 1 : 0;
	m_State.flags.p = checkParity(reg);
	//m_State.flags.ac = getLowerNib(reg) != 0 ? 1 : 0;  ???
}

uint16_t e8080::Emulator8080::add16(uint16_t a, uint16_t b)
{
	m_State.flags.cy = a + b > 0xFFFF ? 1 : 0;
	return a + b;
}

void e8080::Emulator8080::shiftLeft(uint8_t& Reg, size_t count)
{
	Reg = (Reg << count) | (Reg >> (8 - count));
	if ((Reg & 1) == 1) m_State.flags.cy;
}

void e8080::Emulator8080::shiftRight(uint8_t& Reg, size_t count)
{
	Reg = (Reg >> count) | (Reg >> (8 - count));
	if ((Reg & 0b10000000) == 1) m_State.flags.cy;
}

void e8080::Emulator8080::incAdrReg(uint8_t& RegA, uint8_t& RegB)
{
	if (++RegB == 0x00) {
		RegA++;
	}
}

void e8080::Emulator8080::decAdrReg(uint8_t& RegA, uint8_t& RegB)
{
	if (--RegB == 0xFF) {
		--RegA;
	}
}

inline bool e8080::Emulator8080::checkParity(uint8_t val) const
{
	char count = 0;
	for (char i = 0; i < 8; i++) {
		if ((val >> i) & 1) {
			count++;
		}
	}
	return (count % 2) == 0;
}

inline uint16_t e8080::Emulator8080::regTo16(uint8_t Reg0, uint8_t Reg1) const
{
	uint16_t adrOut = Reg0;
	adrOut <<= 8;
	adrOut += Reg1;

	return adrOut;
}

void e8080::Emulator8080::updateRamBuffers(size_t adr, unsigned int rows, unsigned int columns)
{
	if (m_RamBufferUpdated) {
		delete[] m_RamBuffer;
		m_RamBuffer = new uint8_t[m_RamBufferUpdatedSize];
		std::memcpy(m_RamBuffer, m_RamBufferUpdated, m_RamBufferUpdatedSize);
		m_RamBufferSize = m_RamBufferUpdatedSize;

		m_isRamBufferFilled = true;
	}

	size_t length = static_cast<size_t>(rows) * columns;
	delete[] m_RamBufferUpdated;
	m_RamBufferUpdated = new uint8_t[length];
	std::memcpy(m_RamBufferUpdated, m_State.mem + adr, length);

	m_RamBufferUpdatedSize = length;
}

inline const std::string e8080::Emulator8080::chToHex(char character) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(static_cast<unsigned char>(character));
	std::string str = stream.str().substr(stream.str().size() - 2);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}

inline const std::string e8080::Emulator8080::int8ToHex(uint8_t character) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(character);
	std::string str = stream.str().substr(stream.str().size() - 2);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}

inline const std::string e8080::Emulator8080::int16Tohex(unsigned short value) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(4) << std::setfill('0') << value;
	std::string str = stream.str().substr(stream.str().size() - 4);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}