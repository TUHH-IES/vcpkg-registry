vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF f622001be9aa3a735aaa109b7b6fefc9f11d2840
  SHA512 f910c148761776978940110c969a7fc6939f4a9a0c352c8a43609e4b09094e54915f51fb18e364bb4c6eb9baae79a561e4bd8e2a8a64ca1764568a9d5ccc90ae
  HEAD_REF master
)

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