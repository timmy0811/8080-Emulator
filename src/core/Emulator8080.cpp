#include "Emulator8080.h"

e8080::Emulator8080::~Emulator8080()
{
	delete[] m_RomBuffer;
}

bool e8080::Emulator8080::disassembleFromFile()
{
	if (!m_RomBuffer) {
		LOGC("Load rom file before disassembling", LOG_COLOR::WARNING);
		return false;
	}

	size_t romPtr = 0x0;

	while (romPtr < m_RomBufferSize) {
		const char byte = *(m_RomBuffer + romPtr);
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

const char* e8080::Emulator8080::getAsssemblerLine(unsigned char opcode)
{
	std::string line;

	switch (opcode) {
	case 0x00: line += "NOP"; break;
	case 0x01: line += "LXI "; break;
	}

	return line.c_str();
}