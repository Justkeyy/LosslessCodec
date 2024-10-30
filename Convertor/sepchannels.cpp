#include "sepchannels.h"

std::vector<std::vector<unsigned char>> ChannelsSep(std::vector<unsigned char> pixvec, int& width, int& height, int patt, int BpS, int color)
{
    switch (patt)
    {
        case static_cast<int>(Pattern::grbg):
        {
            switch (BpS)
            {
                case 8:
                {
                    return ChannelsSepGRBG_8(pixvec, width, height, color);
                }
                case 12:
                {
                    return ChannelsSepGRBG_12(pixvec, width, height, color);
                }
                case 16:
                {
                    return ChannelsSepGRBG_16(pixvec, width, height, color);
                }
                default:
                {
                    throw ("the is no such BpS!");
                }
            }
        }
        default:
        {
            throw ("the is no such pattern!");
        }
    }
}

std::vector<std::vector<unsigned char>> ChannelsSepGRBG_8(std::vector<unsigned char> pixvec, int& width, int& height, int color)
{
    std::vector<unsigned char> red;
    red.resize((width * height)/3);
    std::vector<unsigned char> green;
    green.resize((width * height)/3);
    std::vector<unsigned char> blue;
    blue.resize((width * height)/3);

    for (int i = 0, total = 0 ; i < height; i += 2)
    {
        for (int j = 0; j < width; j += 3)
        {
            red[total] = pixvec[(i+1)*width + j + 1];
            green[total] = pixvec[i*width + j];
            blue[total] = pixvec[(i+1)*width + j];

            ++total;

            red[total] = pixvec[i*width + j + 1];
            green[total] = pixvec[i*width + j + 2];
            blue[total] = pixvec[(i + 1)*width + j + 2] ;

            ++total;
        }
    }

    width = width * 2 / 3;
    height = height  / 2;

    std::vector<unsigned char> RGBpixels;
    RGBpixels.resize(width*height*color);
    for (int i = 0, total = 0; i < height*width*color; i += 3)
    {
        RGBpixels[i] = red[total];
        RGBpixels[i + 1] = green[total];
        RGBpixels[i + 2] = blue[total];
        ++total;
    }

    std::vector<std::vector<unsigned char>> VecVecPix;
    VecVecPix.push_back(RGBpixels);

    return VecVecPix;
}

std::vector<std::vector<unsigned char>> ChannelsSepGRBG_12(std::vector<unsigned char> pixvec, int& width, int& height, int color)
{
    std::vector<unsigned char> red;
    red.resize((width * height * 1.5)/3);
    std::vector<unsigned char> green;
    green.resize((width * height * 1.5)/3);
    std::vector<unsigned char> blue;
    blue.resize((width * height * 1.5)/3);

    for (int i = 0, total = 0 ; i < height; i += 2)
    {
        for (int j = 0; j < width*1.5; j += 3)
        {
            red[total] = pixvec[(i+1)*width*1.5 + j + 1];
            green[total] = pixvec[i*width*1.5 + j];
            blue[total] = pixvec[(i+1)*width*1.5 + j];

            ++total;

            red[total] = pixvec[i*width*1.5 + j + 1];
            green[total] = pixvec[i*width*1.5 + j + 2];
            blue[total] = pixvec[(i + 1)*width*1.5 + j + 2];

            ++total;
        }
    }

    width = width * 2 / 3;
    height = height  / 2;

    std::vector<unsigned char> RGBpixels;
    RGBpixels.resize(width*height*color*1.5);

    for (int i = 0, total = 0; i < height*width*color*1.5; i += 3)
    {
        RGBpixels[i] = red[total];
        RGBpixels[i + 1] = green[total];
        RGBpixels[i + 2] = blue[total];
        ++total;
    }

    std::vector<std::vector<unsigned char>> VecVecPix;
    VecVecPix.push_back(RGBpixels);
    return VecVecPix;
}

std::vector<std::vector<unsigned char>> ChannelsSepGRBG_16(std::vector<unsigned char> pixvec, int& width, int& height, int color)
{
    std::vector<unsigned char> red1;
    red1.resize((width * height)/3);
    std::vector<unsigned char> green1;
    green1.resize((width * height)/3);
    std::vector<unsigned char> blue1;
    blue1.resize((width * height)/3);

    std::vector<unsigned char> red2;
    red2.resize((width * height)/3);
    std::vector<unsigned char> green2;
    green2.resize((width * height)/3);
    std::vector<unsigned char> blue2;
    blue2.resize((width * height)/3);

    for (int i = 0, total = 0 ; i < height; i += 2)
    {
        for (int j = 0; j < width*2; j += 6)
        {
            red1[total] = pixvec[(i+1)*width*2 + j + 2];
            green1[total] = pixvec[i*width*2 + j];
            blue1[total] = pixvec[(i+1)*width*2 + j];

            red2[total] = pixvec[(i+1)*width*2 + j + 3];
            green2[total] = pixvec[i*width*2 + j + 1];
            blue2[total] = pixvec[(i+1)*width*2 + j + 1];

            ++total;

            red1[total] = pixvec[i*width*2 + j + 2];
            green1[total] = pixvec[i*width*2 + j + 4];
            blue1[total] = pixvec[(i + 1)*width*2 + j + 4];

            red2[total] = pixvec[i*width*2 + j + 3];
            green2[total] = pixvec[i*width*2 + j + 5];
            blue2[total] = pixvec[(i + 1)*width*2 + j + 5];

            ++total;
        }
    }

    width = width * 2 / 3;
    height = height  / 2;

    std::vector<unsigned char> RGBpixels1;
    RGBpixels1.resize(width*height*color);
    std::vector<unsigned char> RGBpixels2;
    RGBpixels2.resize(width*height*color);

    for (int i = 0, total = 0; i < height*width*color; i += 3)
    {
        RGBpixels1[i] = red1[total];
        RGBpixels1[i + 1] = green1[total];
        RGBpixels1[i + 2] = blue1[total];

        RGBpixels2[i] = red2[total];
        RGBpixels2[i + 1] = green2[total];
        RGBpixels2[i + 2] = blue2[total];
        ++total;
    }

    std::vector<std::vector<unsigned char>> VecVecPix;
    VecVecPix.push_back(RGBpixels1);
    VecVecPix.push_back(RGBpixels2);
    return VecVecPix;
}
