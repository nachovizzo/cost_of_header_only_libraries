cmake_minimum_required(VERSION 3.10)
project(fmt_header_only)

find_package(fmt REQUIRED)

set(CMAKE_BUILD_TYPE Release)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Generate N programs
set(N_PROGRAMS "1000" CACHE STRING "How many application examples you want to build")
message(STATUS "Generating ${N_PROGRAMS} application examples")
execute_process(COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/generate_programs.sh ${N_PROGRAMS})

# Compile them
file(GLOB applications "${CMAKE_CURRENT_BINARY_DIR}/application*.cpp")

# Generate header_only targets
add_custom_target(header_only)
foreach(application ${applications})
  get_filename_component(TARGET_NAME ${application} NAME_WE)
  add_executable(${TARGET_NAME}_header_only ${application})
  target_link_libraries(${TARGET_NAME}_header_only PRIVATE fmt::fmt-header-only)
  add_dependencies(header_only ${TARGET_NAME}_header_only)
endforeach()

# Generate linked targets
add_custom_target(linked_library)
foreach(application ${applications})
  get_filename_component(TARGET_NAME ${application} NAME_WE)
  add_executable(${TARGET_NAME}_linked_library ${application})
  target_link_libraries(${TARGET_NAME}_linked_library PRIVATE fmt::fmt)
  add_dependencies(linked_library ${TARGET_NAME}_linked_library)
endforeach()
