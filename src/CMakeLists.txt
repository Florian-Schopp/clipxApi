# CMakeLists.txt

# Always set the cmake min version.
cmake_minimum_required(VERSION 3.0)

set(PROJECT_VERSION "1.0")

# Set the variable PROJ_NAME to whatever your library's name is, PROJECT_VERSION should be a version string like "0.1"
project(mylib VERSION ${PROJECT_VERSION})
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(mylib SHARED)
target_sources(mylib
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)
set_target_properties(mylib
    PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION}
)

# Let's set compiler-specific flags
if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    # G++
    target_compile_options(mylib PRIVATE -Wall -Wextra)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
    # MSVC
    target_compile_options(mylib PRIVATE /EHsc /MTd /W2 /c)

    # Set the DLLEXPORT variable to export symbols
    target_compile_definitions(mylib PRIVATE WIN_EXPORT)
endif()