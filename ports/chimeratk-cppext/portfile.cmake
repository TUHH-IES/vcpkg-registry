vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ChimeraTK/cppext
  REF 5ffe5e12a3ac6caafe59adaa7a5a9299ff44e5b9
  SHA512 a0ffa3a85c96f0258b9180b64c9e8f20ce04e4385aed3284a341e18a65916edb608de2dd05af7196c41f3f993341d3d2f8c06cc969f3482051e8be1df2473404
  HEAD_REF master
  PATCHES 
    001.patch
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    -DBUILD_TESTS=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
