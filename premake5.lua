--include "Dependencies.lua"

workspace "TestWorkspace"
	architecture "x64"

	configurations {
		"Debug",
		"Release"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	startproject "TestProject"

	project "TestProject"
		location "Source/TestProject"
		kind "ConsoleApp"
		language "c++"
		cppdialect "c++17"
		
		files {
			"%{prj.location}/**.cpp",
			"%{prj.location}/**.hpp"
		}
		
		targetdir ("%{wks.location}/Build/Binary/" .. outputdir .. "/%{prj.name}")
		objdir ("%{wks.location}/Build/Object/" .. outputdir .. "/%{prj.name}")
		
		-- TODO: Fix PCH on linux
		filter "system:windows"
			pchheader "PCH.hpp"
			pchsource "%{prj.location}/PCH.cpp"
		filter {}
		
		links {
			"glfw3",
		}
		
		-- WINDOWS
		filter "system:windows"
			includedirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-windows/include",
				"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/include",
			}
		
	
		
		filter { "system:windows", "configurations:Debug" }
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-windows/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/lib",
			}
		
		
		filter { "system:windows", "configurations:Release" }
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-windows/debug/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/debug/lib",
			}
		
		-- LINUX
		filter "system:linux"
			includedirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-linux/include",
				"%{wks.location}/Tools/vcpkg/installed/x64-linux-static/include",
			}
			
			links { "dl", "pthread", "X11" }
		
		filter { "system:linux", "configurations:Debug" }
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-linux/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-linux-static/lib",
			}
		
		filter { "system:linux", "configurations:Release" }
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-linux/debug/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-linux-static/debug/lib",
			}
