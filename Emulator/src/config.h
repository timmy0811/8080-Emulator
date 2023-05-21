#pragma once
#include "windowsWrapper.h"

#include <yaml-cpp/yaml.h>
#include "glm/glm.hpp"

#include <string>
#include <iostream>

#define LOG(message) std::cout << message << std::endl
#define ASSERT(x) if((x)) __debugbreak();

enum class LOG_COLOR { LOG = 15, WARNING = 14, OK = 10, FAULT = 12, SPECIAL_A = 11, SPECIAL_B = 13 };

static HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
inline void LOGC(const std::string& msg, LOG_COLOR color = LOG_COLOR::LOG) {
	SetConsoleTextAttribute(hConsole, (int)color);
	std::cout << msg << '\n';
	SetConsoleTextAttribute(hConsole, 15);
}

namespace Configuration::Global {
	inline glm::ivec2 windowSize;
}

class Config {
private:
	const std::string m_Path;
public:
	Config(const std::string& path)
		:m_Path(path)
	{
		Parse();
	}

	void Parse() {
		LOGC("Parsing Config", LOG_COLOR::SPECIAL_A);
		YAML::Node mainNode = YAML::LoadFile(m_Path);

		WIN_WIDTH_DEFAULT = mainNode["config"]["window"]["Width"].as<unsigned int>();
		WIN_HEIGHT_DEFAULT = mainNode["config"]["window"]["Height"].as<unsigned int>();

		Configuration::Global::windowSize = { WIN_WIDTH_DEFAULT, WIN_HEIGHT_DEFAULT };
	}

	// Window
	unsigned int WIN_WIDTH_DEFAULT = 0;
	unsigned int WIN_HEIGHT_DEFAULT = 0;
};

extern Config conf;