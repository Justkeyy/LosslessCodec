#include <vector>
#include <map>
#include "debayerization.h"



std::vector<unsigned char> BlackAndWhite(std::vector<unsigned char> pixvec, int width, int hight)
{
    int color = 3;
    std::vector<unsigned char> nvec;
    nvec.resize(width*hight*color);

    for (int i = 0, total = 0; i < hight; i= i + 2)
    {
        for (int j = 0; j < width*color; j = j + 3)
        {
            nvec[i*width*color + j] = pixvec[total];
            nvec[i*width*color + j + 1] = pixvec[total];
            nvec[i*width*color + j + 2] = pixvec[total];

            nvec[(i+1)*width*color + j] = pixvec[total+width];
            nvec[(i+1)*width*color + j + 1] = pixvec[total+width];
            nvec[(i+1)*width*color + j + 2] = pixvec[total+width];

            ++total;
        }
        total = total + width;
    }

    return nvec;
}

std::vector<unsigned char> Pattern(std::vector<unsigned char> pixvec, int width, int hight, int patt, int color)
{
    switch (patt)
    {
        case static_cast<int>(Pattern::grbg):
        {
            return PatternGRBG(pixvec, width, hight, color);
        }
        default:
        {
            throw ("the is no such pattern!");
        }
    }
}

std::vector<unsigned char> PatternGRBG(std::vector<unsigned char> pixvec, int width, int hight, int color)
{
    std::vector<unsigned char> nvec;
    nvec.resize(pixvec.size()*color);

    for (int i = 0, total = 0 ; i < hight; i= i + 2)
    {
        for (int j = 0; j < width*color; j += 2*color)
        {
            //green
            nvec[i*width*color + j + static_cast<int>(ColInd::red)] = 0x02;
            nvec[i*width*color + j + static_cast<int>(ColInd::green)] = pixvec[total];
            nvec[i*width*color + j + static_cast<int>(ColInd::blue)] = 0x02;
            //blue
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::red)] = 0x02;
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::green)] = 0x02;
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::blue)] = pixvec[total + width];
            ++total;

            //red
            nvec[i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)] = pixvec[total + 1];
            nvec[i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)] = 0x02;
            nvec[i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)] = 0x02;
            //green
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)] = 0x02;
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)] = pixvec[total + width + 1];
            nvec[(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)] = 0x02;
            ++total;
        }
        total = total + width;
    }

    return nvec;
}

std::vector<unsigned char> Demosaic (std::vector<unsigned char> pixvec, int width, int hight, int patt, int color)
{
    switch (patt)
    {
        case static_cast<int>(Pattern::grbg):
        {
            return DemosaicGRBG(pixvec, width, hight, color);
        }
        default:
        {
            throw ("the is no such pattern!");
        }
    }
}

std::vector<unsigned char> DemosaicGRBG (std::vector<unsigned char> pixvec, int width, int hight, int color)
{
    std::vector<unsigned char> nvec = pixvec;

    for (int i = 1; i < hight-1; i += 2)
    {
        for (int j = 1*color; j < (width-1)*color; j += (2*color)) //green blue red green
        {
            //green
            nvec [i*width*color + j + static_cast<int>(ColInd::red)] =
                (nvec [(i-1)*width*color + j + static_cast<int>(ColInd::red)]
                + nvec [(i-1)*width*color + j + static_cast<int>(ColInd::red)])/2;
            nvec [i*width*color + j + static_cast<int>(ColInd::blue)] =
                (nvec [i*width*color + j - static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)]
                + nvec [i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)])/2;
            //blue
            nvec [i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)] =
                (nvec [(i-1)*width*color + j + static_cast<int>(ColInd::red)]
                + nvec [(i+1)*width*color + j + static_cast<int>(ColInd::red)]
                + nvec [(i-1)*width*color + j + 2*static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)]
                + nvec [(i+1)*width*color + j + 2*static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)])/4;
            nvec [i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)] =
                (nvec [i*width*color + j + static_cast<int>(ColInd::green)]
                + nvec [i*width*color + j + 2*static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)]
                + nvec [(i-1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)]
                + nvec [(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)]
                )/4;

            ///////////////////////////////////////////////////////////////////////////////////////////////
            //red
            nvec [(i+1)*width*color + j + static_cast<int>(ColInd::green)] =
                (nvec[i*width*color + j + static_cast<int>(ColInd::green)]
                 + nvec[(i+2)*width*color + j + static_cast<int>(ColInd::green)]
                 + nvec[(i+1)*width*color + j - static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)]
                 + nvec[(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::green)])/4;

            nvec [(i+1)*width*color + j + static_cast<int>(ColInd::blue)] =
                (nvec [i*width*color + j - static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)]
                 + nvec [i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)]
                 + nvec [(i+2)*width*color + j - static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)]
                 + nvec [(i+2)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)])/4;

            //green
            nvec [(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)] =
                (nvec [(i+1)*width*color + j + static_cast<int>(ColInd::red)]
                 + nvec [(i+1)*width*color + j + 2*static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)])/2;
            nvec [(i+1)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::blue)] =
                (nvec [i*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)]
                 + nvec [(i+2)*width*color + j + static_cast<int>(ColInd::rgb) + static_cast<int>(ColInd::red)])/2;
        }
    }

    return nvec;
}


