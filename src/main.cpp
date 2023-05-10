#include "core/Emulator8080.h"

int main(int argc, char* argv[]) {
	e8080::Emulator8080 MicrProc8080 = e8080::Emulator8080();
	MicrProc8080.loadRomFromFile("rom_samples/spaceInvaders.a26");

	return 0;
}