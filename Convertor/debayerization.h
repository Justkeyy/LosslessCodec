#pragma once
#include "Constants.h"
#include <vector>


std::vector<unsigned char> BlackAndWhite(std::vector<unsigned char> pixvec, int width, int hight);
std::vector<unsigned char> Pattern(std::vector<unsigned char> pixvec, int width, int hight, int patt, int color = 3);

std::vector<unsigned char>PatternGRBG(std::vector<unsigned char> pixvec, int width, int hight, int color);

std::vector<unsigned char> Demosaic (std::vector<unsigned char> pixvec, int width, int hight, int patt, int color);

std::vector<unsigned char> DemosaicGRBG (std::vector<unsigned char> pixvec, int width, int hight, int color);

