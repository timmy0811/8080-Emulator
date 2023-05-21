#pragma once

#include <cstdint>

namespace e8080 {
	struct Operation {
		char* assemblerCode;
		unsigned char parameters;
	};

	struct Flags {
		uint8_t z : 1;
		uint8_t s : 1;
		uint8_t p : 1;
		uint8_t cy : 1;
		uint8_t ac : 1;
		uint8_t pad : 3;
	};

	struct State {
		uint8_t A;
		uint8_t B;
		uint8_t C;
		uint8_t D;
		uint8_t E;
		uint8_t H;
		uint8_t L;

		uint16_t SP;
		uint16_t PC;
		uint8_t* mem;

		Flags flags;

		State(bool clearOnInit) {
			mem = (uint8_t*)std::malloc(65536);
			if (clearOnInit) {
				std::fill(mem, mem + 65536, 0x00);
			}
		}

		~State() {
			free(mem);
		}
	};
}