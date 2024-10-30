#pragma once
#include <string>
#include <cstring>
#include <vector>

std::vector<std::uint8_t> ReadFromDNG(std::string wpath, int height, int width, int offsets, int bitspersample = 8);
std::vector<unsigned char> ReadFromFormat(std::string wpath, int& height, int& width, int& colors);

