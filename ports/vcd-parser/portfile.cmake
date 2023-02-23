vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 2cd46549b96877ee5b2b129a3d275b6452a4ff44
  SHA512 2cdc95d70876208325fb1b75158f630fd8b14f0ad4c34873da840fc42e50003d4268e61a96c0a8e74bd2a884797e38aa3b5e25161fba344504dccec2aa9447f7
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