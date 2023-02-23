vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 8cc96062a2e72bf5fc8fd28894ed0f2b2d399256
  SHA512 e09332fef0788504d89a6991e8530fd96f1aa6f3a61252c65debc755919b606224ba7d3d6c2e82ba363203f0186d2a90d6fb4ec67b0edb6623ecfba28170544a
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