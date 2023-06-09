#pragma once

#include "GLFW/glfw3.h"

#include "config.h"

void OnWindowResize() {
	// Notify observers ...
	LOGC("Resized", LOG_COLOR::LOG);
	Configuration::Global::updateResize = true;
}

bool pollResizeEvent(GLFWwindow* window) {
	Configuration::Global::updateResize = false;
	int x, y;
	glfwGetWindowSize(window, &x, &y);

	if (x != Configuration::Global::windowSize.x || y != Configuration::Global::windowSize.y) {
		Configuration::Global::windowSize = { x, y };

		OnWindowResize();
		return true;
	}

	return false;
}