cmake_minimum_required(VERSION 2.8)

# group files (headers, sources, etc.)
get_cmake_property(properties VARIABLES)
foreach(property ${properties})
	if(NOT property STREQUAL "")
		string(REGEX MATCH ".+_FILES$" fileGroup ${property})
		set(fileTopGroup "${${fileGroup}_GROUP}")
		if(fileGroup)
			GroupFiles("${fileGroup}" "${fileTopGroup}")
		endif()
	endif()
endforeach()

if(TARGET ${PROJECT_NAME})

	set(allDependenciesIncludeDirs)

	set(linkerDependencies ${ADDITIONAL_LINKER_DEPENDENCIES} ${LINKER_DEPENDENCIES})
	foreach(linkerDependency ${linkerDependencies})
		if(TARGET ${linkerDependency})
			get_target_property(dependencyIncludeDirs ${linkerDependency} INCLUDE_DIRECTORIES)
			set(allDependenciesIncludeDirs ${allDependenciesIncludeDirs} ${dependencyIncludeDirs})
		endif()
	endforeach()
	list(LENGTH allDependenciesIncludeDirs allDependenceIncludeDirsCount)
	if(NOT allDependenceIncludeDirsCount EQUAL 0)
		list(REMOVE_DUPLICATES allDependenciesIncludeDirs)
		include_directories(${allDependenciesIncludeDirs})
	endif()

	# compile definitions
	set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_DEFINITIONS "${GLOBAL_COMPILER_DEFINES};${ADDITIONAL_COMPILER_DEFINES};${COMPILER_DEFINES}")

	# compile flags
	set(COMPILER_FLAGS_OS_SPECIFIC "")
	if(WIN32)
		set(COMPILER_FLAGS_OS_SPECIFIC "-wd4250 -wd4251 -wd4275 -wd4675 -wd4996 /bigobj")
	endif()
	set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_FLAGS "${COMPILER_FLAGS_OS_SPECIFIC} ${COMPILER_FLAGS}")

	# link dependencies
	target_link_libraries(${PROJECT_NAME} ${ADDITIONAL_LINKER_DEPENDENCIES} ${LINKER_DEPENDENCIES})

	#link flags
	set(LINKER_FLAGS_OS_SPECIFIC "")
	if(WIN32)
		set(LINKER_FLAGS_OS_SPECIFIC "")
	endif()
	set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "${LINKER_FLAGS_OS_SPECIFIC} ${LINKER_FLAGS}")

endif()
