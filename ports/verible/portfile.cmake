vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verible
  REF 93a4a2db617d285c7b1821d829258c7459bce007
  SHA512 beab44a254a8c885cfb8577529a03aacb57674feb7c0e6dfa58b65266f8d70df5aa4a69afdf9812634c579a0b883aa4e65a4c459cbf95d3f1eeb71b85c280322
  HEAD_REF cmake_build
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DVERIBLE_TEST=OFF
    -DVERIBLE_COMMIT_TIMESTAMP=1744210925
    -DVERIBLE_GIT_DESCRIBE="v0.0-3958-g7aae5c08-13-g15a49668"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/common/tools" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/diff" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/formatter" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_with_dir_test/include_dir" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/multi_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/lint/testdata" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/images" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/src" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/obfuscator" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/preprocessor" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/project" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/syntax/export_json_examples")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
