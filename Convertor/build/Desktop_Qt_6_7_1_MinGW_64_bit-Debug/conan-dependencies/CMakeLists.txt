
        cmake_minimum_required(VERSION 3.15)

        unset(CMAKE_PROJECT_INCLUDE_BEFORE CACHE)
        project(conan-setup)

        if (2.6 VERSION_GREATER_EQUAL 2.0)
          set(CONAN_COMMAND "C:/Users/minec/AppData/Local/Programs/Python/Python312/Scripts/conan.exe")
          include("C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/.qtc/package-manager/conan_provider.cmake")
          conan_profile_detect_default()
          detect_host_profile("C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/conan_host_profile")

          set(build_types ${CMAKE_BUILD_TYPE})
          if (CMAKE_CONFIGURATION_TYPES)
            set(build_types ${CMAKE_CONFIGURATION_TYPES})
          endif()

          foreach(type ${build_types})
            conan_install(
              -pr "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/conan_host_profile"
              --build=missing
              -s build_type=${type}
              -g CMakeDeps)
          endforeach()

          get_property(CONAN_INSTALL_SUCCESS GLOBAL PROPERTY CONAN_INSTALL_SUCCESS)
          if (CONAN_INSTALL_SUCCESS)
            get_property(CONAN_GENERATORS_FOLDER GLOBAL PROPERTY CONAN_GENERATORS_FOLDER)
            file(TO_CMAKE_PATH "${CONAN_GENERATORS_FOLDER}" CONAN_GENERATORS_FOLDER)
            file(WRITE "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/conan_paths.cmake" "
              list(PREPEND CMAKE_PREFIX_PATH \"${CONAN_GENERATORS_FOLDER}\")
              list(PREPEND CMAKE_MODULE_PATH \"${CONAN_GENERATORS_FOLDER}\")
              list(PREPEND CMAKE_FIND_ROOT_PATH \"${CONAN_GENERATORS_FOLDER}\")
              list(REMOVE_DUPLICATES CMAKE_PREFIX_PATH)
              list(REMOVE_DUPLICATES CMAKE_MODULE_PATH)
              list(REMOVE_DUPLICATES CMAKE_FIND_ROOT_PATH)
              set(CMAKE_PREFIX_PATH \"\${CMAKE_PREFIX_PATH}\" CACHE STRING \"\" FORCE)
              set(CMAKE_MODULE_PATH \"\${CMAKE_MODULE_PATH}\" CACHE STRING \"\" FORCE)
              set(CMAKE_FIND_ROOT_PATH \"\${CMAKE_FIND_ROOT_PATH}\" CACHE STRING \"\" FORCE)
            ")
          endif()
        else()
          include("C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/.qtc/package-manager/conan.cmake")
          conan_cmake_run(
            CONANFILE "C:/Users/minec/Desktop/Convertor/conanfile.txt"
            INSTALL_FOLDER "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies"
            GENERATORS cmake_paths cmake_find_package json
            BUILD missing
            ENV CONAN_CMAKE_TOOLCHAIN_FILE="C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/toolchain.cmake"
          )
        endif()
      