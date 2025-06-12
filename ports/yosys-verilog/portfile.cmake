vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO TUHH-IES/yosys_verilog
    REF a6ac2b9615676f6a2f0f997a91ee782f5d3e3bab
    SHA512 63e4610b1b3f5db58d5bb5533210454c0b3df7e30e6ffd07bf01aa153a1ebeec2859d1f7b6c958fd6fe95a3c427bf845a14b36b85d4e36ec1d8bb1180a8e06f6
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
