vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ChimeraTK/DeviceAccess
  REF 2d676770552f014ea513f0dd2f0ac239a2a2d5d9
  SHA512 f720a426ac2ba7add7d365b34a651ab1792c16b0c1b157a7ac60d1d6403bfbad4230f2754d74f0a905d7a894ac105baad46e22e0c7f4f6d52007a030895b0aec
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
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
