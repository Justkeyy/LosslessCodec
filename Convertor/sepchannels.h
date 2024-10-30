#pragma once
#include "Constants.h"
#include <vector>


std::vector<std::vector<unsigned char>> ChannelsSep(std::vector<unsigned char> pixvec, int& width, int& height, int patt, int BpS, int color);
std::vector<std::vector<unsigned char>> ChannelsSepGRBG_8(std::vector<unsigned char> pixvec, int& width, int& height, int color);
std::vector<std::vector<unsigned char>> ChannelsSepGRBG_12(std::vector<unsigned char> pixvec, int& width, int& height, int color);
std::vector<std::vector<unsigned char>> ChannelsSepGRBG_16(std::vector<unsigned char> pixvec, int& width, int& height, int color);

