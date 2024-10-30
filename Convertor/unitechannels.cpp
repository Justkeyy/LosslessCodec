#include "unitechannels.h"


std::vector<unsigned char> ChannelsUnite(std::vector<std::vector<unsigned char>> pixvec, int& width, int& height, int patt, int BpS, int color)
{
    switch (patt)
    {
        case static_cast<int>(Pattern::grbg):
        {
            switch (BpS)
            {
                case 8:
                {
                    return ChannelsUniteGRBG_8(pixvec, width, height, color);
                }
                case 12:
                {
                    return ChannelsUniteGRBG_12(pixvec, width, height, color);
                }
                case 16:
                {
                    return ChannelsUniteGRBG_16(pixvec, width, height, color);
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

std::vector<unsigned char> ChannelsUniteGRBG_8(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color)
{
    std::vector<unsigned char> RGBpixels = RGBpixelsVV[0];

    std::vector<unsigned char> red;
    red.resize(width * height);
    std::vector<unsigned char> green;
    green.resize(width * height);
    std::vector<unsigned char> blue;
    blue.resize(width * height);

    for (int i = 0, total = 0; i < height*width*color; i += 3)
    {
        red[total] = RGBpixels[i];
        green[total] = RGBpixels[i + 1];
        blue[total] = RGBpixels[i + 2];
        ++total;
    }

    width = width * 3 / 2;
    height = height * 2;

    std::vector<unsigned char> pixvec;
    pixvec.resize(width*height);

    for (int i = 0, total = 0; i <height ; i += 2)
    {
        for (int j = 0; j < width ; j += 3)
        {

                pixvec[(i+1)*width + j + 1] = red[total];
                pixvec[i*width + j] = green[total];
                pixvec[(i+1)*width + j] = blue[total];

            ++total;

                pixvec[i*width + j + 1] = red[total];
                pixvec[i*width + j + 2] = green[total];
                pixvec[(i + 1)*width + j + 2] = blue[total];

            ++total;
        }
    }

    return pixvec;
}

std::vector<unsigned char> ChannelsUniteGRBG_12(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color)
{
    std::vector<unsigned char> RGBpixels1 = RGBpixelsVV[0];
    std::vector<unsigned char> RGBpixels2 = RGBpixelsVV[1];

    std::vector<unsigned char> red;
    red.resize(width * height * 1.5);
    std::vector<unsigned char> green;
    green.resize(width * height * 1.5);
    std::vector<unsigned char> blue;
    blue.resize(width * height * 1.5);


    for (int i = 0, total = 0; i < height*width*color*1.5; i += 3)
    {
        red[total] = RGBpixels1[i];
        green[total] = RGBpixels1[i + 1];
        blue[total] = RGBpixels1[i + 2];
        ++total;
    }

    width = width * 3 / 2;
    height = height * 2;

    std::vector<unsigned char> pixvec;
    pixvec.resize(width*height*1.5);

    for (int i = 0, total = 0 ; i < height; i += 2)
    {
        for (int j = 0; j < width*1.5; j += 3)
        {
            pixvec[(i+1)*width*1.5 + j + 1] = red[total];
            pixvec[i*width*1.5 + j] = green[total];
            pixvec[(i+1)*width*1.5 + j] = blue[total];

            ++total;

            pixvec[i*width*1.5 + j + 1] = red[total];
            pixvec[i*width*1.5 + j + 2] = green[total];
            pixvec[(i + 1)*width*1.5 + j + 2] = blue[total];

            ++total;
        }
    }

    return pixvec;
}

std::vector<unsigned char> ChannelsUniteGRBG_16(std::vector<std::vector<unsigned char>> RGBpixelsVV, int& width, int& height, int color)
{
    std::vector<unsigned char> RGBpixels1 = RGBpixelsVV[0];
    std::vector<unsigned char> RGBpixels2 = RGBpixelsVV[1];

    std::vector<unsigned char> red1;
    red1.resize(width * height);
    std::vector<unsigned char> green1;
    green1.resize(width * height);
    std::vector<unsigned char> blue1;
    blue1.resize(width * height);

    std::vector<unsigned char> red2;
    red2.resize(width * height);
    std::vector<unsigned char> green2;
    green2.resize(width * height);
    std::vector<unsigned char> blue2;
    blue2.resize(width * height);

    for (int i = 0, total = 0; i < height*width*color; i += 3)
    {
        red1[total] = RGBpixels1[i];
        green1[total] = RGBpixels1[i + 1];
        blue1[total] = RGBpixels1[i + 2];

        red2[total] = RGBpixels2[i];
        green2[total] = RGBpixels2[i + 1];
        blue2[total] = RGBpixels2[i + 2];
        ++total;
    }

    width = width * 3 / 2;
    height = height * 2;

    std::vector<unsigned char> pixvec;
    pixvec.resize(width*height*2);

    for (int i = 0, total = 0 ; i < height; i += 2)
    {
        for (int j = 0; j < width*2; j += 6)
        {
            pixvec[(i+1)*width*2 + j + 2] = red1[total];
            pixvec[i*width*2 + j] = green1[total];
            pixvec[(i+1)*width*2 + j] = blue1[total];

            pixvec[(i+1)*width*2 + j + 3] = red2[total];
            pixvec[i*width*2 + j + 1] = green2[total];
            pixvec[(i+1)*width*2 + j + 1] = blue2[total];

            ++total;

            pixvec[i*width*2 + j + 2] = red1[total];
            pixvec[i*width*2 + j + 4] = green1[total];
            pixvec[(i + 1)*width*2 + j + 4] = blue1[total];

            pixvec[i*width*2 + j + 3] = red2[total];
            pixvec[i*width*2 + j + 5] = green2[total];
            pixvec[(i + 1)*width*2 + j + 5] = blue2[total];

            ++total;
        }
    }

    return pixvec;
}

