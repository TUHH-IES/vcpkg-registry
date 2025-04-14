vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verible
  REF 40bd3fc1f780f3fddbe4a09771f95d1e8769aabb
  SHA512 109395ac56f8e42201075fcb2c12e145aff9bfea70116cc75e69ae3484dda0a61c021efafc59fc2295f56102094883b418107bdbb3222835180728eed067ecc7
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
    -DVERIBLE_COMMIT_TIMESTAMP=1744620867
    -DVERIBLE_GIT_DESCRIBE="v0.0-3958-g7aae5c08-13-g15a49668"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/common/tools" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/diff" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/formatter" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_with_dir_test/include_dir" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/multi_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/lint/testdata" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/images" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/src" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/obfuscator" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/preprocessor" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/project" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/syntax/export_json_examples")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_with_dir_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/lint" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/syntax")
file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
