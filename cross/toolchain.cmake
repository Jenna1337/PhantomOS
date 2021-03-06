# ld/CMakeLists.txt
# 
# This file is part of PhantomOS.
#
# PhantomOS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# PhantomOS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with PhantomOS.  If not, see <https://www.gnu.org/licenses/>.
#
# PhantomOS is additionally distributed with a system call exemption
# As an exeption to the above license, 
#  proprietary software may interface with this software through the use of 
#  "system calls" to access any of the routines made available by the PhantomOS 
#  to programs written to be employed by the user.

set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(PHANTOM_TARGET_NAME ${CMAKE_SYSTEM_PROCESSOR}-pc-none-eabi)

find_program(CMAKE_C_COMPILER NAMES clang ${PHANTOM_TARGET_NAME}-clang ${PHANTOM_TARGET_NAME}-cc ${PHANTOM_TARGET_NAME}-gcc
        REQUIRED)

find_program(CMAKE_AR NAMES ${PHANTOM_TARGET_NAME}-ar llvm-ar ${PHANTOM_TARGET_NAME}-llvm-ar ar
        REQUIRED)
find_program(CMAKE_RANLIB NAMES ${PHANTOM_TARGET_NAME}-ranlib llvm-ranlib ${PHANTOM_TARGET_NAME}-llvm-ranlib ranlib
        REQUIRED)

set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffreestanding -static")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostdlib")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(PHANTOM_TOOLCHAIN_PRESENT "yes")
