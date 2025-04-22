vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gian21391/yosys_verilog
    REF 66b271c517bb11709a2237582134e338e64cb9c4
    SHA512 811eccf6ba477ee24eb87f0d94457639377b17925578916dafeaaca67ff47bfa8efdd4f1e01681050d94ae95c0af88c2e2ab79d1da8409faaec5cda2029f49e1
    HEAD_REF main
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "yosys-verilog")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/yosys-verilog/usage" COPYONLY)