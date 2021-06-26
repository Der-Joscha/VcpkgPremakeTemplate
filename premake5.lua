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
		kind "ConsoleApp"
		language "c++"
		cppdialect "c++17"
		
		files {
			"Source/**.cpp",
			"Source/**.hpp"
		}
		
		targetdir ("%{wks.location}/Build/Binary/" .. outputdir .. "/%{prj.name}")
		objdir ("%{wks.location}/Build/Object/" .. outputdir .. "/%{prj.name}")

		pchheader "PCH.hpp"
		pchsource "Source/PCH.cpp"


		includedirs {
			"%{wks.location}/Tools/vcpkg/installed/x64-windows/include",
			"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/include",
		}
		
		links {
			"glfw3",
		}
		
		filter "configurations:Debug"
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-windows/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/lib",
			}
		
		
		filter "configurations:Release"
			libdirs {
				"%{wks.location}/Tools/vcpkg/installed/x64-windows/debug/lib",
				"%{wks.location}/Tools/vcpkg/installed/x64-windows-static/debug/lib",
			}