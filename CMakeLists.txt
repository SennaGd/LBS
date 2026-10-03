cmake_minimum_required(VERSION 4.3)
project(LBS)

find_package(Lua REQUIRED)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)

	

include_directories(include)
include_directories(src/handler)
include_directories(scripts)

add_executable(
	LBS

    src/main.c
)


target_include_directories(LBS PRIVATE ${LUA_INCLUDE_DIR})
target_link_libraries(LBS PRIVATE ${LUA_LIBRARIES})
