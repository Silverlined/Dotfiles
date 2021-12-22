cmake_minimum_required(VERSION 3.2)   # setting this is required
PROJECT(example_project C CXX)            # this sets the project name

set (CMAKE_CXX_STANDARD 11)
#set(CMAKE_C_STANDARD 11)
#set(CMAKE_C_STANDARD_REQUIRED True)

if ( ${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR} )

message( FATAL_ERROR "IN-SOURCE BUILDS NOT ALLOWED\nCreate ./build directory and re-run cmake ../ from there." )

endif()
###############################################################################
## file globbing ##############################################################
###############################################################################

# These instructions search the directory tree when cmake is
# invoked and put all files that match the pattern in the variables 
# `sources` and `data`.
file(GLOB_RECURSE sources      src/*.c src/*.h src/*.cpp)
file(GLOB_RECURSE sources_test test/*.c)
file(GLOB_RECURSE resources res/)
# You can use set(sources src/main.cpp) etc if you don't want to
# use globbing to find files automatically.

###############################################################################
## target definitions #########################################################
###############################################################################

# The data is just added to the executable, because in some IDEs (QtCreator) 
# files are invisible when they are not explicitly part of the project.
add_executable(example ${sources})

# Just for example add some compiler flags.
target_compile_options(example PRIVATE -g -Wall -pedantic -O3)

add_custom_target(graphviz
    DEPENDS
        "${CMAKE_BINARY_DIR}/graphviz"
)

add_custom_command(
    OUTPUT
        "${CMAKE_BINARY_DIR}/graphviz"
    COMMENT
        "Generating graphviz dependencies graph"
    COMMAND 
        ${CMAKE_COMMAND} "--graphviz=graphviz/${CMAKE_PROJECT_NAME}.dot" .
    COMMAND 
        dot -Tpng graphviz/${CMAKE_PROJECT_NAME}.dot -o ${CMAKE_SOURCE_DIR}/${CMAKE_PROJECT_NAME}-graphviz.png
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
    VERBATIM
)
###############################################################################
## dependencies ###############################################################
###############################################################################

find_package(cppzmq REQUIRED)
target_link_libraries(example PRIVATE cppzmq)

# Add any library dependencies
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/plugins/)
#add_library(add MODULE ${PROJECT_SOURCE_DIR}/src/math/add.c)
#set_target_properties(
#    add
#PROPERTIES PREFIX "plugin-")

# This copies all resource files in the build directory.
# We need this, because we want to work with paths relative to the executable.
#file(COPY ${input_data} DESTINATION res/input_data)

###############################################################################
## packaging ##################################################################
###############################################################################
# (sudo make install) 
include(GNUInstallDirs)
message(${CMAKE_INSTALL_BINDIR})
install(TARGETS example DESTINATION ${CMAKE_INSTALL_BINDIR})
