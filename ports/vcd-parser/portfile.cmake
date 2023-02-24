vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 525a6e5b22abc22f23400eda4755ef2bbb621970
  SHA512 f7b33e3e6b22b2fabe532fe9714979f25585e1281b81cb08071c3cd7f3e39036082e35946aece612d2c3909d9bf4b4122ff580df60d370b0c7e00c47a271ef27
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