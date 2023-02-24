vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 176a28be86f67ac6a5750c56ef7927029b1fa16d
  SHA512 acb00bb9acf86b68ff5a6de9031b0a47692dc059dd11181bdc1bae8d3745e74d26151f3a55d28967ceecf1ef6c8d6eca2cfbb05203851a40d3d4ce2d8a301add
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