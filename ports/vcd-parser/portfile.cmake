vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TUHH-IES/verilog-vcd-parser
  REF 36aa16f998d6fa3c1342e953f90ed3a386b2253c
  SHA512 9cf6827f15fb5b8f9d590d87d0a7ca8fdce81c63c8eb233fdbd8b8e1569b2195d0f375279e448f8d9e75628a84f9a7be10c0d22dd408f3946c937eb72184f562
  HEAD_REF master
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
