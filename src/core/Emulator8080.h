#pragma once

#include <iostream>

#include <string>
#include <fstream>
#include <sstream>

#include "config.h"

namespace e8080 {
	class Emulator8080
	{
	public:
		explicit Emulator8080() = default;
		~Emulator8080();

		bool disassembleFromFile();
		bool loadRomFromFile(const std::string& path);

	private:
		unsigned char* m_RomBuffer;
		size_t m_RomBufferSize;

		const char* getAsssemblerLine(unsigned char opcode);
	};
}
