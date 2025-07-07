# vcpkg-registry

Tutorial: Package a library with vcpkg
https://learn.microsoft.com/en-us/vcpkg/get_started/get-started-packaging?pivots=shell-bash

Tutorial: Add a port to the vcpkg open-source registry
https://learn.microsoft.com/en-us/vcpkg/get_started/get-started-adding-to-registry?pivots=shell-bash

* In the current vcpkg registry structure, we have 5 vcpkg-sample-library(yosys-verilog, vcd-parser,...) within custom-overlay/port's directory.
* For every commit within the vcpkg-sample-library, the corresponding commit ID needs to be updated in **REF** of **vcpkg_from_github**. This provides the version of the source code to download.
* Follow the "Tutorial: Package a library with vcpkg", for vcpkg registry update after **vcpkg-sample-library** update.
* Make sure to update SHA512 in **portfile.cmake** for the updated **REF** - obatined after executing the command "vcpkg install vcpkg-sample-library --overlay-ports=C:\path\to\custom-overlay"

* Steps for updating the versions for each updated vcpkg-sample-library is specified in "Tutorial: Add a port to the vcpkg open-source registry". The console output if version is already up-to-date:
  ![image](https://github.com/user-attachments/assets/2f9dea8e-6372-468c-99b3-50c3208f0162). Else the versions are updated for the respective vcpkg-sample-library. 
  (Make sure to commit and push all the changes within the **port's directory** before executing this command)
* Every update in portfile.cmake of a vcpkg-sample-library needs a corresponding update in their corresponding versions within **vcpkg-registry/versions**
* If the command "vcpkg x-add-version vcpkg-sample-library" does not recognize the vcpkg-sample-library as shown in the image, compute the necessary git-tree hash as mentioned in the next steps
![image](https://github.com/user-attachments/assets/49a6dba2-d3be-483d-ae44-083250c48c51)
* Execute command "git rev-parse HEAD:ports/vcpkg-sample-library" to get the git-tree hash value for vcpkg-sample-library within custom-overlay/port's directory.
  (Make sure to commit and push all the changes within the **port's directory** before executing this command)
* Console output for the above command results in git-tree value to be updated in the **versions** directory for every vcpkg-sample-library
  ![image](https://github.com/user-attachments/assets/fc9dbf71-82ff-4fc9-8bee-b29be1b3e4ae)
* The other necessary parameters for versions directory of vcpkg-sample-library like **version** and **port-version** can be obtained from **vcpkg.json** of "ports/vcpkg-sample-library/"
* Alternatively, command x-add-verion works with additional options passed. Use command "vcpkg x-add-version vcpkg-sample-library --debug --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions" instead
