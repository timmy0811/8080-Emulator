#include "Emulator8080.h"

e8080::Emulator8080::~Emulator8080()
{
	delete[] m_RomBuffer;
}

bool e8080::Emulator8080::disassemble()
{
	if (!m_RomBuffer) {
		LOGC("Load rom file before disassembling", LOG_COLOR::WARNING);
		return false;
	}

	size_t romPtr = 0x0;
	m_RomDisassembled = fmt::format("; Source: {}\n; Disassembled by 8080Emulator-Util\n\n; 8080 Assembler		| Rom in hex\n;---------------------------------------------\n", m_RomPath);
	while (romPtr < m_RomBufferSize) {
		const unsigned char byte = *(m_RomBuffer + romPtr);
		m_RomDisassembled += getAsssemblerLine(byte, romPtr);

		romPtr++;
	}

	return false;
}

bool e8080::Emulator8080::loadRomFromFile(const std::string& path)
{
	std::ifstream romCode(path, std::ios::binary | std::ios::ate);
	if (!romCode.is_open()) {
		LOGC("Failed loading rom: " + path, LOG_COLOR::FAULT);
		return false;
	}

	// Get the size of the file
	std::streamsize size = romCode.tellg();
	romCode.seekg(0, std::ios::beg);

	// Read the file into a vector
	std::vector<char> buffer(size);
	if (!romCode.read(buffer.data(), size)) {
		LOGC("Failed loading rom into memory: " + path, LOG_COLOR::FAULT);
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
		LOGC("Error: Cannot write dissambled to file!", LOG_COLOR::FAULT);
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

		// Controllflow Instructions
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

	switch (opcode) {
		// Increment Decrement
	case 0x00: cycles = 4; break;
	case 0x01: cycles = 10;
		m_State.C = m_RomBuffer[++m_State.PC];
		m_State.B = m_RomBuffer[++m_State.PC];
		break;
	case 0x02: cycles = 7;
		m_State.mem[regTo16(m_State.B, m_State.C)];
		break;
	case 0x03: cycles = 5;
		incAdrReg(m_State.B, m_State.C);
		break;
	case 0x04: cycles = 5;
		m_State.B++;
		break;
	case 0x05: cycles = 5;
		m_State.B--;
		break;
	case 0x06: cycles = 7;
		m_State.B = m_RomBuffer[++m_State.PC];
		break;
	case 0x07: cycles = 4;
		shiftLeft(m_State.A, 1);
		break;
	case 0x09: cycles = 10;
		uint16_t sum = add16(regTo16(m_State.H, m_State.L), regTo16(m_State.B, m_State.C));
		m_State.H = getHigherNib(sum);
		m_State.L = getHigherNib(sum);
		break;
	case 0x0a: cycles = 7;
		m_State.A = regTo16(m_State.B, m_State.C);
		break;
	case 0x0b: cycles = 5;
		decAdrReg(m_State.B, m_State.C);
		break;
	case 0x0c: cycles = 5; break;
	case 0x0d: cycles = 5; break;
	case 0x0e: cycles = 7; break;
	case 0x0f: cycles = 4; break;
	case 0x11: cycles = 10; break;
	case 0x12: cycles = 7; break;
	case 0x13: cycles = 5; break;
	case 0x14: cycles = 5; break;
	case 0x15: cycles = 5; break;
	case 0x16: cycles = 7; break;
	case 0x17: cycles = 4; break;
	case 0x19: cycles = 10; break;
	case 0x1a: cycles = 7; break;
	case 0x1b: cycles = 5; break;
	case 0x1c: cycles = 5; break;
	case 0x1d: cycles = 5; break;
	case 0x1e: cycles = 7; break;
	case 0x1f: cycles = 4; break;
	case 0x20: cycles = 4; break;
	case 0x21: cycles = 10; break;
	case 0x22: cycles = 16; break;
	case 0x23: cycles = 5; break;
	case 0x24: cycles = 5; break;
	case 0x25: cycles = 5; break;
	case 0x26: cycles = 7; break;
	case 0x27: cycles = 4; break;
	case 0x29: cycles = 10; break;
	case 0x2a: cycles = 16; break;
	case 0x2b: cycles = 5; break;
	case 0x2c: cycles = 5; break;
	case 0x2d: cycles = 5; break;
	case 0x2e: cycles = 7; break;
	case 0x2f: cycles = 4; break;
	case 0x30: cycles = 4; break;
	case 0x31: cycles = 10; break;
	case 0x32: cycles = 13; break;
	case 0x33: cycles = 5; break;
	case 0x34: cycles = 10; break;
	case 0x35: cycles = 10; break;
	case 0x36: cycles = 10; break;
	case 0x37: cycles = 4; break;
	case 0x39: cycles = 10; break;
	case 0x3a: cycles = 13; break;
	case 0x3b: cycles = 5; break;
	case 0x3c: cycles = 5; break;
	case 0x3d: cycles = 5; break;
	case 0x3e: cycles = 7; break;
	case 0x3f: cycles = 4; break;

	case 0x40: cycles = 4; break;
	case 0x41: cycles = 4; break;
	case 0x42: cycles = 4; break;
	case 0x43: cycles = 4; break;
	case 0x44: cycles = 4; break;
	case 0x45: cycles = 4; break;
	case 0x46: cycles = 7; break;
	case 0x47: cycles = 4; break;
	case 0x48: cycles = 4; break;
	case 0x49: cycles = 4; break;
	case 0x4a: cycles = 4; break;
	case 0x4b: cycles = 4; break;
	case 0x4c: cycles = 4; break;
	case 0x4d: cycles = 4; break;
	case 0x4e: cycles = 7; break;
	case 0x4f: cycles = 4; break;
	case 0x50: cycles = 4; break;
	case 0x51: cycles = 4; break;
	case 0x52: cycles = 4; break;
	case 0x53: cycles = 4; break;
	case 0x54: cycles = 4; break;
	case 0x55: cycles = 4; break;
	case 0x56: cycles = 7; break;
	case 0x57: cycles = 4; break;
	case 0x58: cycles = 4; break;
	case 0x59: cycles = 4; break;
	case 0x5a: cycles = 4; break;
	case 0x5b: cycles = 4; break;
	case 0x5c: cycles = 4; break;
	case 0x5d: cycles = 4; break;
	case 0x5e: cycles = 7; break;
	case 0x5f: cycles = 4; break;
	case 0x60: cycles = 4; break;
	case 0x61: cycles = 4; break;
	case 0x62: cycles = 4; break;
	case 0x63: cycles = 4; break;
	case 0x64: cycles = 4; break;
	case 0x65: cycles = 4; break;
	case 0x66: cycles = 7; break;
	case 0x67: cycles = 4; break;
	case 0x68: cycles = 4; break;
	case 0x69: cycles = 4; break;
	case 0x6a: cycles = 4; break;
	case 0x6b: cycles = 4; break;
	case 0x6c: cycles = 4; break;
	case 0x6d: cycles = 4; break;
	case 0x6e: cycles = 7; break;
	case 0x6f: cycles = 4; break;
	case 0x70: cycles = 7; break;
	case 0x71: cycles = 7; break;
	case 0x72: cycles = 7; break;
	case 0x73: cycles = 7; break;
	case 0x74: cycles = 7; break;
	case 0x75: cycles = 7; break;
	case 0x76: cycles = 7; break;
	case 0x77: cycles = 7; break;
	case 0x78: cycles = 4; break;
	case 0x79: cycles = 4; break;
	case 0x7a: cycles = 4; break;
	case 0x7b: cycles = 4; break;
	case 0x7c: cycles = 4; break;
	case 0x7d: cycles = 4; break;
	case 0x7e: cycles = 7; break;
	case 0x7f: cycles = 4; break;

	case 0x80: cycles = 4; break;
	case 0x81: cycles = 4; break;
	case 0x82: cycles = 4; break;
	case 0x83: cycles = 4; break;
	case 0x84: cycles = 4; break;
	case 0x85: cycles = 4; break;
	case 0x86: cycles = 7; break;
	case 0x87: cycles = 4; break;
	case 0x88: cycles = 4; break;
	case 0x89: cycles = 4; break;
	case 0x8a: cycles = 4; break;
	case 0x8b: cycles = 4; break;
	case 0x8c: cycles = 4; break;
	case 0x8d: cycles = 4; break;
	case 0x8e: cycles = 7; break;
	case 0x8f: cycles = 4; break;
	case 0x90: cycles = 4; break;
	case 0x91: cycles = 4; break;
	case 0x92: cycles = 4; break;
	case 0x93: cycles = 4; break;
	case 0x94: cycles = 4; break;
	case 0x95: cycles = 4; break;
	case 0x96: cycles = 7; break;
	case 0x97: cycles = 4; break;
	case 0x98: cycles = 4; break;
	case 0x99: cycles = 4; break;
	case 0x9a: cycles = 4; break;
	case 0x9b: cycles = 4; break;
	case 0x9c: cycles = 4; break;
	case 0x9d: cycles = 4; break;
	case 0x9e: cycles = 7; break;
	case 0x9f: cycles = 4; break;
	case 0xa0: cycles = 4; break;
	case 0xa1: cycles = 4; break;
	case 0xa2: cycles = 4; break;
	case 0xa3: cycles = 4; break;
	case 0xa4: cycles = 4; break;
	case 0xa5: cycles = 4; break;
	case 0xa6: cycles = 7; break;
	case 0xa7: cycles = 4; break;
	case 0xa8: cycles = 4; break;
	case 0xa9: cycles = 4; break;
	case 0xaa: cycles = 4; break;
	case 0xab: cycles = 4; break;
	case 0xac: cycles = 4; break;
	case 0xad: cycles = 4; break;
	case 0xae: cycles = 7; break;
	case 0xaf: cycles = 4; break;
	case 0xb0: cycles = 4; break;
	case 0xb1: cycles = 4; break;
	case 0xb2: cycles = 4; break;
	case 0xb3: cycles = 4; break;
	case 0xb4: cycles = 4; break;
	case 0xb5: cycles = 4; break;
	case 0xb6: cycles = 7; break;
	case 0xb7: cycles = 4; break;
	case 0xb8: cycles = 4; break;
	case 0xb9: cycles = 4; break;
	case 0xba: cycles = 4; break;
	case 0xbb: cycles = 4; break;
	case 0xbc: cycles = 4; break;
	case 0xbd: cycles = 4; break;
	case 0xbe: cycles = 7; break;
	case 0xbf: cycles = 4; break;

	case 0xc0: cycles = 999; break;
	case 0xc1: cycles = 10; break;
	case 0xc2: cycles = 10; break;
	case 0xc3: cycles = 10; break;
	case 0xc4: cycles = 999; break;
	case 0xc5: cycles = 11; break;
	case 0xc6: cycles = 7; break;
	case 0xc7: cycles = 11; break;
	case 0xc8: cycles = 999; break;
	case 0xc9: cycles = 10; break;
	case 0xca: cycles = 10; break;
	case 0xcc: cycles = 999; break;
	case 0xcd: cycles = 17; break;
	case 0xce: cycles = 7; break;
	case 0xcf: cycles = 11; break;
	case 0xd0: cycles = 999; break;
	case 0xd1: cycles = 10; break;
	case 0xd2: cycles = 10; break;
	case 0xd3: cycles = 10; break;
	case 0xd4: cycles = 999; break;
	case 0xd5: cycles = 11; break;
	case 0xd6: cycles = 7; break;
	case 0xd7: cycles = 11; break;
	case 0xd8: cycles = 999; break;
	case 0xda: cycles = 10; break;
	case 0xdb: cycles = 10; break;
	case 0xdc: cycles = 999; break;
	case 0xde: cycles = 7; break;
	case 0xdf: cycles = 11; break;
	case 0xe0: cycles = 999; break;
	case 0xe1: cycles = 10; break;
	case 0xe2: cycles = 10; break;
	case 0xe3: cycles = 18; break;
	case 0xe4: cycles = 99; break;
	case 0xe5: cycles = 11; break;
	case 0xe6: cycles = 7; break;
	case 0xe7: cycles = 11; break;
	case 0xe8: cycles = 99; break;
	case 0xe9: cycles = 5; break;
	case 0xea: cycles = 10; break;
	case 0xeb: cycles = 5; break;
	case 0xec: cycles = 999; break;
	case 0xee: cycles = 7; break;
	case 0xef: cycles = 11; break;
	case 0xf0: cycles = 999; break;
	case 0xf1: cycles = 10; break;
	case 0xf2: cycles = 10; break;
	case 0xf3: cycles = 4; break;
	case 0xf4: cycles = 999; break;
	case 0xf5: cycles = 11; break;
	case 0xf6: cycles = 7; break;
	case 0xf7: cycles = 11; break;
	case 0xf8: cycles = 999; break;
	case 0xf9: cycles = 5; break;
	case 0xfa: cycles = 10; break;
	case 0xfb: cycles = 4; break;
	case 0xfc: cycles = 17; break;
	case 0xfe: cycles = 7; break;
	case 0xff: cycles = 11; break;

	default: break;
	}

	return true;
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

uint16_t e8080::Emulator8080::add16(uint16_t a, uint16_t b)
{
	return a + b;
}

void e8080::Emulator8080::shiftLeft(uint8_t& Reg, size_t count)
{
	Reg = (Reg << count) | (Reg >> 8 - count);
	if ((Reg & 1) == 1) m_State.flags.cy;
}

void e8080::Emulator8080::shiftRight(uint8_t& Reg, size_t count)
{
	Reg = (Reg >> count) | (Reg >> 8 - count);
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

inline uint16_t e8080::Emulator8080::regTo16(uint8_t Reg0, uint8_t Reg1) const
{
	uint16_t adrOut = Reg0;
	adrOut <<= 8;
	adrOut += Reg1;

	return adrOut;
}

inline const std::string e8080::Emulator8080::chToHex(char character) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(static_cast<unsigned char>(character));
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