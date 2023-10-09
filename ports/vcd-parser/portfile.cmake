vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 6ec5666669844591d50ec886b573efb7252baf61
  SHA512 eff9f8699145cc79f3925cf65de2ca297349b7c3247be6590a2b605c75d0f4ad86696a70f181824e469f74a5b9c24114b5d5e8f156d4413044033000ec323e77
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
