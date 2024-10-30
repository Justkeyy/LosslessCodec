#include "formatreader.h"
#include "qoi.h"
#include "stb_image.h"
#include <fstream>
#include <algorithm>

std::vector<std::uint8_t> ReadFromDNG(std::string wpath, int height, int width, int offsets, int bitspersample)
{
    std::vector<std::uint8_t> result;

    result.resize(height*width * bitspersample / 8);

    std::ifstream input(wpath, std::ios::binary);
    std::copy_n(std::next(std::istreambuf_iterator<char>{input}, offsets), result.size(), result.begin());

    return result;
}

std::vector<unsigned char> ReadFromFormat(std::string wpath, int& height, int& width, int& colors)
{
    void* pixels = NULL;

    std::vector<unsigned char> nvec;
    nvec.resize(height*width*colors);

    if (std::string_view{wpath}.ends_with(".png")) {
        if (!stbi_info(wpath.c_str(), &width, &height, &colors)) {
            printf("Couldn't read header %s\n", wpath.c_str());
            exit(1);
        }

        // Force all odd encodings to be RGBA
        if (colors != 3) {
            colors = 4;
        }

        pixels = (void*)stbi_load(wpath.c_str(), &width, &height, NULL, colors);
    }
    else if (std::string_view{wpath}.ends_with(".qoi")) {
        qoi_desc desc;
        pixels = qoi_read(wpath.c_str(), &desc, 0);
        colors = desc.channels;
        width = desc.width;
        height = desc.height;
    }

    nvec.insert(nvec.begin(),(unsigned char*)pixels, (unsigned char*)pixels+(height*width*colors));

    delete [] pixels;
    return nvec;
}

