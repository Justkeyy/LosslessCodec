#pragma once
#include <exiv2/exiv2.hpp>

void printExif (Exiv2::ExifData & ed);
std::string FindExifValue(Exiv2::ExifData &ed, std::string key);
