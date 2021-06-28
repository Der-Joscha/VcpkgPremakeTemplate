#include "PCH.hpp"

#include <GLFW/glfw3.h>

int main()
{
    glfwInit();

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    const auto wnd = glfwCreateWindow(800, 600, "Nein zu RB!", nullptr, nullptr);
    glfwMakeContextCurrent(wnd);

    while(!glfwWindowShouldClose(wnd))
	{
	    glfwPollEvents();
	    glfwSwapBuffers(wnd);
	}

    auto cnt = 0;
    auto mond = glfwGetMonitors(&cnt);

    for(auto i = 0; i < cnt; ++i)
	{
	    const auto name = glfwGetMonitorName(mond[i]);
		int x, y;
		glfwGetMonitorPhysicalSize(mond[i], &x, &y);
	
		std::cout << name << '\n';
		std::cout << x << 'x' << y << '\n';
		std::cout << '\n';
	}

    glfwDestroyWindow(wnd);

    glfwTerminate();
}