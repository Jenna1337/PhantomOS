
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(PHANTOM_TARGET_NAME ${CMAKE_SYSTEM_PROCESSOR}-pc-elf)

find_program(CMAKE_C_COMPILER NAMES clang ${PHANTOM_TARGET_NAME}-clang ${PHANTOM_TARGET_NAME}-cc ${PHANTOM_TARGET_NAME}-gcc
        REQUIRED)

find_program(CMAKE_AR NAMES ${PHANTOM_TARGET_NAME}-ar llvm-ar ${PHANTOM_TARGET_NAME}-llvm-ar ar
        REQUIRED)
find_program(CMAKE_RANLIB NAMES ${PHANTOM_TARGET_NAME}-ranlib llvm-ranlib ${PHANTOM_TARGET_NAME}-llvm-ranlib ranlib
        REQUIRED)
find_program(_PHANTOM_OS_LINKER NAMES ld.lld ${PHANTOM_TARGET_NAME}-ld.lld ${PHANTOM_TARGET_NAME}-ld ld
        REQUIRED)
set(CMAKE_C_COMPILER_TARGET ${PHANTOM_TARGET_NAME})
set(CMAKE_ASM_COMPILER_TARGET ${PHANTOM_TARGET_NAME})

set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_C_FLAGS "-ffreestanding -static")
set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -fuse-ld=${_PHANTOM_OS_LINKER}")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)