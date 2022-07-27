project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	warnings "Extra"
	staticruntime "on"
	
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-obj/" .. outputdir .. "/%{prj.name}")
	
	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"ASSIMP_BUILD_NO_EXPORT",
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
		"ASSIMP_BUILD_NO_OGRE_IMPORTER",
		"ASSIMP_BUILD_NO_ASSBIN_IMPORTER",
		"ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
		"RAPIDJSON_HAS_STDSTRING=1",
		"RAPIDJSON_NOMEMBERITERATORCLASS",
	}

	files
	{
		"include/**",
        "code/**.h",
        "code/**.cpp",
		"contrib/unzip/*",
		"contrib/zlib/*",
		"contrib/Open3DGC/*",
	}

    includedirs
	{
		"%{prj.location}",
		"code",
		"include",
		"contrib",
		"contrib/zlib",
		"contrib/Open3DGC",
		"contrib/pugixml/src",
		"contrib/rapidjson/include",
		"contrib/unzip",
		"contrib/openddlparser/include",
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
