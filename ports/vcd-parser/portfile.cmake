vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verilog-vcd-parser
  REF 5f5a5b91f174e930d68d87f46e370e3c2aa3fc9c
  SHA512 fb98d41737e7579c3311bbb2874e4cac105cb2535c18185b27649e0c13716b4f6e8d283b60d66eca2f5af2de36fb7e087f1adaa3f3ee492d1592932cf44aaa7c
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