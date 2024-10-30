#include "color_to8bit.h"

#include <cmath>

std::vector<std::uint8_t> color_8bit (std::vector<std::uint8_t> imgvec, int& BpS, double gamma)
{
    std::vector<std::uint8_t> c8b;
    c8b.resize(imgvec.size()*8/BpS);
    switch (BpS)
    {
        case 8:
            {
                for(int i = 0; i < imgvec.size(); i++)
                {
                    c8b[i] = std::pow(double{imgvec[i]} / double((1 << 8) - 1), gamma) * double((1 << 8) - 1);
                }
                return c8b;
            }
        case 12:
            {
                for(int i = 0, j = 0; i < imgvec.size(); i += 3, j += 2)
                {
                    uint32_t pix1 = (uint32_t(imgvec[i])<<4) +(uint32_t(imgvec[i+1] )>> 4) ;
                    uint32_t pix2 = ((uint32_t(imgvec[i+1]) & 0x0F) << 8) + imgvec[i+2];

                    pix1 = std::pow(double{pix1} / double((1 << 12) - 1), gamma) * double((1 << 8) - 1);
                    pix2 = std::pow(double{pix2} / double((1 << 12) - 1), gamma) * double((1 << 8) - 1);

                    c8b[j] = pix1;
                    c8b[j+1] = pix2;
                }
                BpS = 8;
                return c8b;
            }
        case 16:
            {
                for(int i = 0, j = 0; i < imgvec.size(); i += 2, j++)
                {
                    uint32_t pix = (uint32_t(imgvec[i]<<8) + uint32_t(imgvec[i+1]));
                    c8b[j] = std::pow(double{pix} / double((1 << 16) - 1), gamma) * double((1 << 8) - 1);
                }
                BpS = 8;
                return c8b;
            }

        default:
            throw("No such bps!");
    }

}


