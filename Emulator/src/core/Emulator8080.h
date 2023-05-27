#pragma once

#include <iostream>
#include <fmt/core.h>
#include <iomanip>

#include <string>
#include <fstream>
#include <sstream>

#include "imgui/imgui.h"

#include "config.h"
#include "Structures.h"

#define gl Configuration::Global

namespace e8080 {
	class Emulator8080
	{
	public:
		explicit Emulator8080();
		~Emulator8080();

		bool disassemble();
		bool loadRomFromFile(const std::string& path);
		bool saveDisassembledToFile(const std::string& path);
		void executeProgram(float clockMHz = 2.f);
		void executeCurrentInstruction();
		void continueProgram();

		void OnUpdate();
		void OnGuiRender();

	private:
		// System 8080
		float m_ClockMHz;
		e8080::State m_State;

		// Disassembler and Storage
		unsigned char* m_RomBuffer;
		size_t m_RomBufferSize;
		std::string m_RomPath;
		std::string m_RomDisassembled;

		char* m_RomDisassembledArr;

		uint8_t* m_RamBufferUpdated;
		uint8_t* m_RamBuffer;
		size_t m_RamBufferUpdatedSize;
		size_t m_RamBufferSize;
		bool m_isRamBufferFilled;

		uint16_t m_SystemFlags; // ..., CodeBuffRel

		// State
		bool m_InExecution;

	private:
		const std::string getAsssemblerLine(unsigned char opcode, size_t& ptr);
		bool executeInstruction(unsigned char opcode);

		void bitAndAcc(uint8_t val);
		void bitXorAcc(uint8_t val);
		void bitOrAcc(uint8_t val);

		inline uint8_t popStack();
		inline void pushStack(uint8_t val);
		void call();
		void ret();

		void addToAcc(uint8_t valA, uint8_t valB = 0);
		void subFromAcc(uint8_t valA, uint8_t valB = 0, bool cmp = false);
		void addToAccBF(uint8_t valA, uint8_t valB = 0);	// valB is bit-field
		void subFromAccBF(uint8_t valA, uint8_t valB = 0);	// valB is bit-field

		void incReg(uint8_t& reg);
		void decrReg(uint8_t& reg);
		inline uint16_t add16(uint16_t a, uint16_t b);
		void shiftLeft(uint8_t& Reg, size_t count);
		void shiftRight(uint8_t& Reg, size_t count);
		void incAdrReg(uint8_t& RegA, uint8_t& RegB);
		void decAdrReg(uint8_t& RegA, uint8_t& RegB);

		inline bool checkParity(uint8_t val) const;
		inline uint16_t regTo16(uint8_t Reg0, uint8_t Reg1) const;
		inline uint8_t getLowerNib(uint16_t val) const;
		inline uint8_t getHigherNib(uint16_t val) const;
		inline uint8_t getLowerNib(uint8_t val) const;
		inline uint8_t getHigherNib(uint8_t val) const;

		void updateRamBuffers(size_t adr, unsigned int rows, unsigned int columns);
		inline const std::string chToHex(char character) const;
		inline const std::string int8ToHex(uint8_t character) const;
		inline const std::string int16Tohex(unsigned short value) const;

		inline unsigned char bufferB(size_t adr) const { return *(m_RomBuffer + adr); }
		inline const std::string bufferBstr(size_t adr) const { return std::to_string(*(m_RomBuffer + adr)); }
		inline const std::string bufferBstrH(size_t adr) const { return chToHex(*(m_RomBuffer + adr)); }
	};
}
