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
	case 0x40: line << "MOV B, B"; break;
	case 0x41: line << "MOV B, C"; break;
	case 0x42: line << "MOV B, D"; break;
	case 0x43: line << "MOV B, E"; break;
	case 0x44: line << "MOV B, H"; break;
	case 0x45: line << "MOV B, L"; break;
	case 0x46: line << "MOV B, M"; break;
	case 0x47: line << "MOV B, A"; break;
	case 0x48: line << "MOV C, B"; break;
	case 0x49: line << "MOV C, C"; break;
	case 0x4a: line << "MOV C, D"; break;
	case 0x4b: line << "MOV C, E"; break;
	case 0x4c: line << "MOV C, H"; break;
	case 0x4d: line << "MOV C, L"; break;
	case 0x4e: line << "MOV C, M"; break;
	case 0x4f: line << "MOV C, A"; break;
	case 0x50: line << "MOV D, B"; break;
	case 0x51: line << "MOV D, C"; break;
	case 0x52: line << "MOV D, D"; break;
	case 0x53: line << "MOV D, E"; break;
	case 0x54: line << "MOV D, H"; break;
	case 0x55: line << "MOV D, L"; break;
	case 0x56: line << "MOV D, M"; break;
	case 0x57: line << "MOV D, A"; break;
	case 0x58: line << "MOV E, B"; break;
	case 0x59: line << "MOV E, C"; break;
	case 0x5a: line << "MOV E, D"; break;
	case 0x5b: line << "MOV E, E"; break;
	case 0x5c: line << "MOV E, H"; break;
	case 0x5d: line << "MOV E, L"; break;
	case 0x5e: line << "MOV E, M"; break;
	case 0x5f: line << "MOV E, A"; break;
	case 0x60: line << "MOV H, B"; break;
	case 0x61: line << "MOV H, C"; break;
	case 0x62: line << "MOV H, D"; break;
	case 0x63: line << "MOV H, E"; break;
	case 0x64: line << "MOV H, H"; break;
	case 0x65: line << "MOV H, L"; break;
	case 0x66: line << "MOV H, M"; break;
	case 0x67: line << "MOV H, A"; break;
	case 0x68: line << "MOV L, B"; break;
	case 0x69: line << "MOV L, C"; break;
	case 0x6a: line << "MOV L, D"; break;
	case 0x6b: line << "MOV L, E"; break;
	case 0x6c: line << "MOV L, H"; break;
	case 0x6d: line << "MOV L, L"; break;
	case 0x6e: line << "MOV L, M"; break;
	case 0x6f: line << "MOV L, B"; break;
	case 0x70: line << "MOV M, B"; break;
	case 0x71: line << "MOV M, C"; break;
	case 0x72: line << "MOV M, D"; break;
	case 0x73: line << "MOV M, E"; break;
	case 0x74: line << "MOV M, H"; break;
	case 0x75: line << "MOV M, L"; break;
	case 0x76: line << "HLT"; break;
	case 0x77: line << "MOV M, A"; break;
	case 0x78: line << "MOV A, B"; break;
	case 0x79: line << "MOV A, C"; break;
	case 0x7a: line << "MOV A, D"; break;
	case 0x7b: line << "MOV A, E"; break;
	case 0x7c: line << "MOV A, H"; break;
	case 0x7d: line << "MOV A, L"; break;
	case 0x7e: line << "MOV A, M"; break;
	case 0x7f: line << "MOV A, A"; break;

		// Arithmetic Instructions
	case 0x80: line << "ADD B"; break;
	case 0x81: line << "ADD C"; break;
	case 0x82: line << "ADD D"; break;
	case 0x83: line << "ADD E"; break;
	case 0x84: line << "ADD H"; break;
	case 0x85: line << "ADD L"; break;
	case 0x86: line << "ADD M"; break;
	case 0x87: line << "ADD A"; break;
	case 0x88: line << "ADC B"; break;
	case 0x89: line << "ADC C"; break;
	case 0x8a: line << "ADC D"; break;
	case 0x8b: line << "ADC E"; break;
	case 0x8c: line << "ADC H"; break;
	case 0x8d: line << "ADC L"; break;
	case 0x8e: line << "ADC M"; break;
	case 0x8f: line << "ADC A"; break;
	case 0x90: line << "SUB B"; break;
	case 0x91: line << "SUB C"; break;
	case 0x92: line << "SUB D"; break;
	case 0x93: line << "SUB E"; break;
	case 0x94: line << "SUB H"; break;
	case 0x95: line << "SUB L"; break;
	case 0x96: line << "SUB M"; break;
	case 0x97: line << "SUB A"; break;
	case 0x98: line << "SBB B"; break;
	case 0x99: line << "SBB C"; break;
	case 0x9a: line << "SBB D"; break;
	case 0x9b: line << "SBB E"; break;
	case 0x9c: line << "SBB H"; break;
	case 0x9d: line << "SBB L"; break;
	case 0x9e: line << "SBB M"; break;
	case 0x9f: line << "SBB A"; break;
	case 0xa0: line << "ANA B"; break;
	case 0xa1: line << "ANA C"; break;
	case 0xa2: line << "ANA D"; break;
	case 0xa3: line << "ANA E"; break;
	case 0xa4: line << "ANA H"; break;
	case 0xa5: line << "ANA L"; break;
	case 0xa6: line << "ANA M"; break;
	case 0xa7: line << "ANA A"; break;
	case 0xa8: line << "XRA B"; break;
	case 0xa9: line << "XRA C"; break;
	case 0xaa: line << "XRA D"; break;
	case 0xab: line << "XRA E"; break;
	case 0xac: line << "XRA H"; break;
	case 0xad: line << "XRA L"; break;
	case 0xae: line << "XRA M"; break;
	case 0xaf: line << "XRA A"; break;
	case 0xb0: line << "ORA B"; break;
	case 0xb1: line << "ORA C"; break;
	case 0xb2: line << "ORA D"; break;
	case 0xb3: line << "ORA E"; break;
	case 0xb4: line << "ORA H"; break;
	case 0xb5: line << "ORA L"; break;
	case 0xb6: line << "ORA M"; break;
	case 0xb7: line << "ORA A"; break;
	case 0xb8: line << "CMP B"; break;
	case 0xb9: line << "CMP C"; break;
	case 0xba: line << "CMP D"; break;
	case 0xbb: line << "CMP E"; break;
	case 0xbc: line << "CMP H"; break;
	case 0xbd: line << "CMP L"; break;
	case 0xbe: line << "CMP M"; break;
	case 0xbf: line << "CMP A"; break;

		// Controllflow Instructions
	case 0xc0: line << "RNZ"; break;
	case 0xc1: line << "POP B"; break;
	case 0xc2: line << "JNZ"; params = 2; break;
	case 0xc3: line << "JMP"; params = 2; break;
	case 0xc4: line << "CNZ"; params = 2; break;
	case 0xc5: line << "PUSH B"; break;
	case 0xc6: line << "ADI"; params = 1; break;
	case 0xc7: line << "RST 0"; break;
	case 0xc8: line << "RZ"; break;
	case 0xc9: line << "RET"; break;
	case 0xca: line << "JZ"; params = 2; break;
	case 0xcc: line << "CZ"; params = 2; break;
	case 0xcd: line << "Call"; params = 2; break;
	case 0xce: line << "ACI"; params = 1; break;
	case 0xcf: line << "RST 1"; break;
	case 0xd0: line << "RNC"; break;
	case 0xd1: line << "POP D"; break;
	case 0xd2: line << "JNC"; params = 2; break;
	case 0xd3: line << "OUT"; params = 1; break;
	case 0xd4: line << "CNC"; params = 2; break;
	case 0xd5: line << "PUSH D"; break;
	case 0xd6: line << "SUI"; params = 1; break;
	case 0xd7: line << "RST 2"; break;
	case 0xd8: line << "RC"; break;
	case 0xda: line << "JC"; params = 2; break;
	case 0xdb: line << "IN"; params = 1; break;
	case 0xdc: line << "CC"; params = 2; break;
	case 0xde: line << "SBI"; params = 1; break;
	case 0xdf: line << "RST 3"; break;
	case 0xe0: line << "PRO"; break;
	case 0xe1: line << "POP H"; break;
	case 0xe2: line << "JPO"; params = 2; break;
	case 0xe3: line << "XTHL"; break;
	case 0xe4: line << "CPO"; params = 2; break;
	case 0xe5: line << "PUSH H"; break;
	case 0xe6: line << "ANI"; params = 1; break;
	case 0xe7: line << "RST 4"; break;
	case 0xe8: line << "RPE"; break;
	case 0xe9: line << "PCHL"; break;
	case 0xea: line << "JPE"; params = 2; break;
	case 0xeb: line << "XCHG"; break;
	case 0xec: line << "CPE"; params = 2; break;
	case 0xee: line << "XRI"; params = 1; break;
	case 0xef: line << "RST 5"; break;
	case 0xf0: line << "RP"; break;
	case 0xf1: line << "POP PSW"; break;
	case 0xf2: line << "JP"; params = 2; break;
	case 0xf3: line << "DI"; break;
	case 0xf4: line << "CP"; params = 2; break;
	case 0xf5: line << "PUSH PSW"; break;
	case 0xf6: line << "ORI"; params = 1; break;
	case 0xf7: line << "RST 6"; break;
	case 0xf8: line << "RM"; break;
	case 0xf9: line << "SPHL"; break;
	case 0xfa: line << "JM"; params = 2; break;
	case 0xfb: line << "EI"; break;
	case 0xfc: line << "CM"; params = 2; break;
	case 0xfe: line << "CP"; params = 1; break;
	case 0xff: line << "RST 7"; break;

	default: line << "NOP"; LOGC(fmt::format("Warning: Opcode {} not found!", std::to_string(opcode)), LOG_COLOR::WARNING);
	}

	std::string binary;
	switch (params)
	{
	case 1:
		mnemonic = fmt::format("{} #{}h", mnemonic, bufferBstrH(++ptr));
		binary = fmt::format("{} {}", ch2hex(opcode), bufferBstrH(ptr));
		break;
	case 2:
		mnemonic = fmt::format("{} #{}{}h", mnemonic, bufferBstrH(++ptr), bufferBstrH(++ptr));
		binary = fmt::format("{} {} {}", ch2hex(opcode), bufferBstrH(ptr - 1), bufferBstrH(ptr));
		break;
	default:
		binary = mnemonic;
		break;
	}

	std::string comment = fmt::format("; [{}]   {}\n", int162hex(progPtr), binary);

	line << std::left << std::setw(30) << mnemonic << comment;
	return line.str();
}

inline const std::string e8080::Emulator8080::ch2hex(char character) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(static_cast<unsigned char>(character));
	std::string str = stream.str().substr(stream.str().size() - 2);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}

inline const std::string e8080::Emulator8080::int162hex(unsigned short value) const
{
	std::ostringstream stream;
	stream << std::hex << std::setw(4) << std::setfill('0') << value;
	std::string str = stream.str().substr(stream.str().size() - 4);
	std::transform(str.begin(), str.end(), str.begin(), ::toupper);
	return str;
}