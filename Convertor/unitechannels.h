#pragma once
#include "Constants.h"
#include <vector>

std::vector<unsigned char> ChannelsUnite(std::vector<std::vector<unsigned char>> pixvec, int& width, int& height, int patt, int BpS, int color);
std::vector<unsigned char> ChannelsUniteGRBG_8(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color);
std::vector<unsigned char> ChannelsUniteGRBG_12(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color);
std::vector<unsigned char> ChannelsUniteGRBG_16(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color);
