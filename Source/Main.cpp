#include "PCH.hpp"

#include <GLFW/glfw3.h>

int main()
{
	glfwInit();

	glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
	const auto wnd = glfwCreateWindow(800, 600, "Nein zu RB!", nullptr, nullptr);
	glfwMakeContextCurrent(wnd);
	
	while (!glfwWindowShouldClose(wnd))
	{
		glfwPollEvents();
		glfwSwapBuffers(wnd);
	}

	glfwDestroyWindow(wnd);

	glfwTerminate();
}