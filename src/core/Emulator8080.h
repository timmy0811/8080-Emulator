#pragma once

#include <iostream>
#include <fmt/core.h>
#include <iomanip>

#include <string>
#include <fstream>
#include <sstream>

#include "config.h"
#include "Structures.h"

namespace e8080 {
	class Emulator8080
	{
	public:
		explicit Emulator8080() = default;
		~Emulator8080();

		bool disassemble();
		bool loadRomFromFile(const std::string& path);
		bool saveDisassembledToFile(const std::string& path);
		void executeProgram(float clockMHz = 2.f);

	private:
		// System 8080
		float m_ClockMHz;
		e8080::State m_State;

		// Disassembler and Storage
		unsigned char* m_RomBuffer;
		size_t m_RomBufferSize;
		std::string m_RomPath;
		std::string m_RomDisassembled;

	private:
		const std::string getAsssemblerLine(unsigned char opcode, size_t& ptr);
		bool executeInstruction(unsigned char opcode);

		inline const std::string ch2hex(char character) const;
		inline const std::string int162hex(unsigned short value) const;

		inline unsigned char bufferB(size_t adr) const { return *(m_RomBuffer + adr); }
		inline const std::string bufferBstr(size_t adr) const { return std::to_string(*(m_RomBuffer + adr)); }
		inline const std::string bufferBstrH(size_t adr) const { return ch2hex(*(m_RomBuffer + adr)); }
	};
}
