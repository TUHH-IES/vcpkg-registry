vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF ee39f0d50881ffbd39b900debb5e08635401b58d
  SHA512 72083c9f1de05fb24e5887b4b5472ee4d7ed97fad4e10ad20c9f1d2a21952a98b5cb753683e8a34a5526da682dc4e42d44c66762bcdec4dc9ca82a5f46d1a175
  HEAD_REF master
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
