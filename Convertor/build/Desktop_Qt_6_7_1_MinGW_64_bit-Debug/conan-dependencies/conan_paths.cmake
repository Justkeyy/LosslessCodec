
              list(PREPEND CMAKE_PREFIX_PATH "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/build/conan")
              list(PREPEND CMAKE_MODULE_PATH "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/build/conan")
              list(PREPEND CMAKE_FIND_ROOT_PATH "C:/Users/minec/Desktop/Convertor/build/Desktop_Qt_6_7_1_MinGW_64_bit-Debug/conan-dependencies/build/conan")
              list(REMOVE_DUPLICATES CMAKE_PREFIX_PATH)
              list(REMOVE_DUPLICATES CMAKE_MODULE_PATH)
              list(REMOVE_DUPLICATES CMAKE_FIND_ROOT_PATH)
              set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH}" CACHE STRING "" FORCE)
              set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" CACHE STRING "" FORCE)
              set(CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}" CACHE STRING "" FORCE)
            