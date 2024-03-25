vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ChimeraTK/DeviceAccess
  REF 2d676770552f014ea513f0dd2f0ac239a2a2d5d9
  SHA512 f720a426ac2ba7add7d365b34a651ab1792c16b0c1b157a7ac60d1d6403bfbad4230f2754d74f0a905d7a894ac105baad46e22e0c7f4f6d52007a030895b0aec
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
