#include <GLEW/glew.h>
#include <GLFW/glfw3.h>
#include "imgui_helper/imgui.h"

#include "config.h"

#include "core/Emulator8080.h"

int main(int argc, char* argv[]) {
	GLFWwindow* window;

	/* Initialize the library */
	if (!glfwInit())
		return -1;

	// Window hints for glfw
	glfwWindowHint(GLFW_DEPTH_BITS, 24);
	glfwWindowHint(GLFW_SAMPLES, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	window = glfwCreateWindow(conf.WIN_WIDTH, conf.WIN_HEIGHT, "8080-Emulator Education-Ver.", NULL, NULL);
	if (!window)
	{
		glfwTerminate();
		return -1;
	}

	glfwMakeContextCurrent(window);
	glfwSwapInterval(1);
	glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

	glewExperimental = GL_TRUE;
	if (glewInit() != GLEW_OK) {
		std::cout << "Could not init glew." << std::endl;
		return -1;
	}

	// Set Blending
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glEnable(GL_BLEND);

	// ImGui
	ImGuiIO& io = ImGuiInit();

	ImGui_ImplGlfw_InitForOpenGL(window, true);
	ImGui_ImplOpenGL3_Init();

	// Application
	e8080::Emulator8080 MicrProc8080 = e8080::Emulator8080();
	MicrProc8080.loadRomFromFile("rom_samples/si.a26");

	MicrProc8080.disassemble();
	MicrProc8080.saveDisassembledToFile("asm_out/assembler.asm");

	/* Loop until the user closes the window */
	while (!glfwWindowShouldClose(window))
	{
		ImGuiNewFrame();

		// Render in here
		ImGui::Begin("Test");
		ImGui::End();

		ImGuiRender(io);

		// glfw handling
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	ImGuiShutdown();
	glfwTerminate();
	return 0;
}