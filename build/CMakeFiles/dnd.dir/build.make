# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jimmy/labs/dnd

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jimmy/labs/dnd/build

# Include any dependencies generated for this target.
include CMakeFiles/dnd.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dnd.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dnd.dir/flags.make

CMakeFiles/dnd.dir/src/dnd.cpp.o: CMakeFiles/dnd.dir/flags.make
CMakeFiles/dnd.dir/src/dnd.cpp.o: ../src/dnd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jimmy/labs/dnd/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dnd.dir/src/dnd.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dnd.dir/src/dnd.cpp.o -c /home/jimmy/labs/dnd/src/dnd.cpp

CMakeFiles/dnd.dir/src/dnd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dnd.dir/src/dnd.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jimmy/labs/dnd/src/dnd.cpp > CMakeFiles/dnd.dir/src/dnd.cpp.i

CMakeFiles/dnd.dir/src/dnd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dnd.dir/src/dnd.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jimmy/labs/dnd/src/dnd.cpp -o CMakeFiles/dnd.dir/src/dnd.cpp.s

# Object files for target dnd
dnd_OBJECTS = \
"CMakeFiles/dnd.dir/src/dnd.cpp.o"

# External object files for target dnd
dnd_EXTERNAL_OBJECTS =

dnd: CMakeFiles/dnd.dir/src/dnd.cpp.o
dnd: CMakeFiles/dnd.dir/build.make
dnd: CMakeFiles/dnd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jimmy/labs/dnd/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dnd"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dnd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dnd.dir/build: dnd

.PHONY : CMakeFiles/dnd.dir/build

CMakeFiles/dnd.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dnd.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dnd.dir/clean

CMakeFiles/dnd.dir/depend:
	cd /home/jimmy/labs/dnd/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jimmy/labs/dnd /home/jimmy/labs/dnd /home/jimmy/labs/dnd/build /home/jimmy/labs/dnd/build /home/jimmy/labs/dnd/build/CMakeFiles/dnd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dnd.dir/depend

