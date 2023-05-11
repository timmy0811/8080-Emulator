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
	while (romPtr < m_RomBufferSize) {
		const unsigned char byte = *(m_RomBuffer + romPtr);
		std::cout << getAsssemblerLine(byte, romPtr);

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

	return true;
}

const std::string e8080::Emulator8080::getAsssemblerLine(unsigned char opcode, size_t& ptr)
{
	std::string line;

	// Note: ftm::format takes in the last argmument first!

	switch (opcode) {
	case 0x00: line += "NOP				; " + ch2hex(opcode); break;
	case 0x01: line += fmt::format("LXI B {}{}			; 01 {} {}", bufferBstrH(++ptr), bufferBstrH(++ptr), bufferBstrH(ptr + 2), bufferBstrH(ptr + 1)); break;
	case 0x02: line += "STAX B			; 02"; break;
	case 0x03: line += "INX B			; 03"; break;
	case 0x04: line += "INR B			; 04"; break;
	case 0x05: line += "DCR B			; 05"; break;
	case 0x06: line += fmt::format("MVI B {}		; 06 {}", bufferBstrH(ptr), bufferBstrH(++ptr)); break;
	case 0x07: line += "RLC				; 07"; break;
	case 0x09: line += "DAD B			; 09"; break;
	case 0x0a: line += "LDAX B			; 0A"; break;
	case 0x0b: line += "DCX B			; 0B"; break;
	case 0x0c: line += "INC C			; 0C"; break;
	case 0x0d: line += "DCR C			; 0D"; break;
	case 0x0e: line += fmt::format("MVI C, {}		; 0E {}", bufferBstrH(ptr), bufferBstrH(++ptr)); break;
	case 0x0f: line += "RRC				; 0F"; break;
	case 0x11: line += fmt::format("LXI D {}{}			; 10 {} {}", bufferBstrH(++ptr), bufferBstrH(++ptr), bufferBstrH(ptr + 2), bufferBstrH(ptr + 1)); break;
	case 0x12: line += "STAX D				; 12"; break;
	case 0x13: line += "INX D				; 13"; break;
	case 0x14: line += "INR D				; 14"; break;
	case 0x15: line += "DCR D				; 15"; break;
	case 0x16: line += fmt::format("MVI D, {}		; 16 {}", bufferBstrH(ptr), bufferBstrH(++ptr)); break;
	case 0x17: line += "RAL					; 17"; break;
	case 0x19: line += "DAD D				; 19"; break;
	case 0x1a: line += "LDAX D				; 1A"; break;
	case 0x1b: line += "DCX D				; 1B"; break;
	case 0x1c: line += "INR E				; 1C"; break;
	case 0x1d: line += "DCR E				; 1d"; break;
	case 0x1e: line += fmt::format("MVI E, {}		; 1e {}", bufferBstrH(ptr), bufferBstrH(++ptr)); break;
	case 0x1f: line += "RAR					; 1F"; break;
	case 0x20: line += "RIM					; 20"; break;
	case 0x21: line += fmt::format("LXI H {}{}			; 21 {} {}", bufferBstrH(++ptr), bufferBstrH(++ptr), bufferBstrH(ptr + 2), bufferBstrH(ptr + 1)); break;
	case 0x22: line += fmt::format("SHLD {}{}			; 22 {} {}", bufferBstrH(++ptr), bufferBstrH(++ptr), bufferBstrH(ptr + 2), bufferBstrH(ptr + 1)); break;
	case 0x23: line += "INX H				; 23"; break;
	case 0x24: line += "INR H				; 24"; break;
	case 0x25: line += "DCR H				; 25"; break;






	default: line += "NOT_DEFINED";
	}

	line += '\n';
	return line;
}

inline const std::string e8080::Emulator8080::ch2hex(char character) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(static_cast<unsigned char>(character));
	std::string str = stream.str().substr(stream.str().size() - 2);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}
