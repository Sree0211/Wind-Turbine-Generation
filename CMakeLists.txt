cmake_minimum_required(VERSION 3.12)
project(turbine CXX)
set(CMAKE_CXX_STANDARD 17)

# Setting the include directories
include_directories(${CMAKE_SOURCE_DIR}/include)

# Setting the library directories
link_directories(${CMAKE_SOURCE_DIR}/lib)

# Locating OpenGL and GLUT
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

# Locating GLUT explicitly
find_library(GLUT_LIBRARY NAMES glut)
find_path(GLUT_INCLUDE_DIR NAMES glut.h)

# Including directories for OpenGL and GLUT
include_directories(${OPENGL_INCLUDE_DIR} ${GLUT_INCLUDE_DIR})

file(GLOB_RECURSE CPP_SOURCES "src/*.cpp")
add_executable(turbine ${CPP_SOURCES})

target_include_directories(turbine PRIVATE ${OPENGL_INCLUDE_DIR} ${GLUT_INCLUDE_DIR})
target_link_libraries(turbine PUBLIC ${OPENGL_gl_LIBRARY} ${GLUT_LIBRARY})

target_compile_options(turbine PRIVATE -Wall -Wno-deprecated)

# Copy of Doxyfile to the build directory
configure_file(${CMAKE_SOURCE_DIR}/Doxyfile ${CMAKE_BINARY_DIR}/Doxyfile COPYONLY)

# Creating a custom target for generating documentation
add_custom_target(doc COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_BINARY_DIR}/Doxyfile
                  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                  COMMENT "Generating API documentation with Doxygen" VERBATIM)
