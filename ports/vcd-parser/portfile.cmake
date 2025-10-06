vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TUHH-IES/verilog-vcd-parser
  REF 1f2f669d8a9910b15d78dea10e81ca24c9e8f7a7
  SHA512 28c64dbd6f59cc4772ad769cc32459e598c7699727394766cb54ee38ce6530028488245a043fc4393703649a13baf859e914bf6c913946ceb2ec62cb35f0e65c
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
