vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF ee3cf8344e7a514719e144130f6f322e43a1e4c4
  SHA512 046cd85286b87ac767f56daf0b0a82ad75aeae61fcf41c8e8fc23aee1564129606f85ca515a3a21bd7c90c38ae0ac4d9f043148c618700a705f3d785bde9fc6d
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
