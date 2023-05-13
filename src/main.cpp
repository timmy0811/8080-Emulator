#include "core/Emulator8080.h"

int main(int argc, char* argv[]) {
	e8080::Emulator8080 MicrProc8080 = e8080::Emulator8080();
	MicrProc8080.loadRomFromFile("rom_samples/si.a26");

	MicrProc8080.disassemble();
	MicrProc8080.saveDisassembledToFile("asm_out/assembler.asm");

	return 0;
}