vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TUHH-IES/verilog-vcd-parser
  REF 6ebd9ba5d25c7ba7ea60c961485a26a71dbc7919
  SHA512 70a73efe5539c1b6c1f334b6196b691784fb90734e06835b35bc6c95834ba0413e9df42fb7290707258dfdf27f92a505cc50f2ebd5c0f3c618bc60e063b8722e
  HEAD_REF master
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
