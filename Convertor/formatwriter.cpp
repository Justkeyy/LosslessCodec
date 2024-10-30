#include "formatwriter.h"

#define STB_IMAGE_IMPLEMENTATION
#define STBI_ONLY_PNG
#define STBI_NO_LINEAR
#include "stb_image.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#define QOI_IMPLEMENTATION
#include "qoi.h"

void WriteToFormat(std::string wpath, int height, int width, int colors, const std::vector<unsigned char>& pixvec)
{
    const void* pixels = pixvec.data();

    int encoded = 0;
    if (std::string_view{wpath}.ends_with(".png"))
    {
        encoded = stbi_write_png(wpath.c_str(), width, height, colors, pixels, 0);
    }
    else if (std::string_view{wpath}.ends_with(".qoi"))
    {
        qoi_desc temp;
        temp.width = width;
        temp.height = height;
        temp.channels = colors;
        temp.colorspace = QOI_SRGB;
        encoded = qoi_write(wpath.c_str(), pixels, &temp);
    }

    if (!encoded) {
        printf("Couldn't write/encode %s\n", wpath.c_str());
        exit(1);
    }

}

