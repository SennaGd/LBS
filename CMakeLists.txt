cmake_minimum_required(VERSION 4.3)
project(LBS)


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)


include_directories(include)

# Compile executable from source files
add_executable(
	LBS

    src/main.c
)
