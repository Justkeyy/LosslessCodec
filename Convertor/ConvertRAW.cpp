#include <stdio.h>
#include <string.h>
#include <math.h>
#include <iostream>
#include <string>

#include "formatwriter.h"
#include "formatreader.h"
#include "sepchannels.h"
#include "unitechannels.h"
#include "debayerization.h"
#include "color_to8bit.h"
#include "exifreader.h"

std::vector<std::uint8_t> ImgTo_16 (std::vector<std::uint8_t> imgvec)
{
    std::vector<std::uint8_t> c16b;
    c16b.resize(imgvec.size()*2);

    for(int i = 0, total = 0; i < imgvec.size(); i++, total += 2)
    {
        c16b[total] = 0;
        c16b[total+1] = imgvec[i];
    }

    return c16b;
}


int main(void)
{

std::string MyFile = "C:\\Users\\minec\\Desktop\\RawImage\\07.74261.dng";

#if 1

Exiv2::Image::UniquePtr image = Exiv2::ImageFactory::open(MyFile.c_str());
image->readMetadata();
Exiv2::ExifData ed = image->exifData();//get exif information

int color;
int width = stoi(FindExifValue(ed, "Exif.Image.ImageWidth"));
int height = stoi(FindExifValue(ed, "Exif.Image.ImageLength"));
int BpS = stoi(FindExifValue(ed, "Exif.Image.BitsPerSample"));
int StripOffsets = stoi(FindExifValue(ed, "Exif.Image.StripOffsets"));

std::string patternstr = FindExifValue(ed, "Exif.Image.CFAPattern");
int patt;

if (patternstr[0] == '1' && patternstr[2] == '0' && patternstr[4] == '2' && patternstr[6] == '1')
{
    patt = static_cast<int>(Pattern::grbg);
    color = 3;
}

std::vector<unsigned char> img, img2;

img = ReadFromDNG(MyFile, height, width, StripOffsets ,BpS);

img2 = img;

std::vector<std::vector<unsigned char>> vecvec;

vecvec = ChannelsSep(img, width, height, patt, BpS, color);

std::string strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.qoi";
std::string strr = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.qoi";

WriteToFormat(strw, height, width, color, img);
img = ReadFromFormat(strr, height, width, color);

img = ChannelsUnite(vecvec, width, height, patt, BpS, color);

bool cmp = std::lexicographical_compare(img.begin(),img.end(),img2.begin(),img2.end());

img = color_8bit(img, BpS, 0.4);

try{
    img = Pattern(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

try{
img = Demosaic(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.png";

WriteToFormat(strw, height, width, color, img);

#endif


#if 0
Exiv2::Image::UniquePtr image = Exiv2::ImageFactory::open(MyFile.c_str());
image->readMetadata();
Exiv2::ExifData ed = image->exifData();//get exif information

int color;
int width = stoi(FindExifValue(ed, "Exif.Image.ImageWidth"));
int height = stoi(FindExifValue(ed, "Exif.Image.ImageLength"));
int BpS = stoi(FindExifValue(ed, "Exif.Image.BitsPerSample"));
int StripOffsets = stoi(FindExifValue(ed, "Exif.Image.StripOffsets"));

std::string patternstr = FindExifValue(ed, "Exif.Image.CFAPattern");
int patt;

if (patternstr[0] == '1' && patternstr[2] == '0' && patternstr[4] == '2' && patternstr[6] == '1')
{
    patt = static_cast<int>(Pattern::grbg);
    color = 3;
}

std::vector<unsigned char> img, img2;

img = ReadFromDNG(MyFile, height, width, StripOffsets ,BpS);

img = ImgTo_16(img);

img2 = img;

BpS = 16;

std::vector<std::vector<unsigned char>> vecvec;

vecvec = ChannelsSep(img, width, height, patt, BpS, color);

img = ChannelsUnite(vecvec, width, height, patt, BpS, color);

bool cmp = std::lexicographical_compare(img.begin(),img.end(),img2.begin(),img2.end());

img = color_8bit(img, BpS, 0.2);

try{
    img = Pattern(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

try{
img = Demosaic(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

std::string strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.png";

WriteToFormat(strw, height, width, color, img);

#endif


#if 0

Exiv2::Image::UniquePtr image = Exiv2::ImageFactory::open(MyFile.c_str());
image->readMetadata();
Exiv2::ExifData ed = image->exifData();//get exif information

int color;
int width = stoi(FindExifValue(ed, "Exif.Image.ImageWidth"));
int height = stoi(FindExifValue(ed, "Exif.Image.ImageLength"));
int BpS = stoi(FindExifValue(ed, "Exif.Image.BitsPerSample"));
int StripOffsets = stoi(FindExifValue(ed, "Exif.Image.StripOffsets"));

std::string patternstr = FindExifValue(ed, "Exif.Image.CFAPattern");
int patt;

if (patternstr[0] == '1' && patternstr[2] == '0' && patternstr[4] == '2' && patternstr[6] == '1')
{
    patt = static_cast<int>(Pattern::grbg);
    color = 3;
}

std::vector<unsigned char> img;

img = ReadFromDNG(MyFile, height, width, StripOffsets ,BpS);

std::vector<unsigned char> img2 = img;

bool cmp = std::lexicographical_compare(img.begin(),img.end(),img2.begin(),img2.end());

std::vector<std::vector<unsigned char>> vecvec;

vecvec = ChannelsSep(img2, width, height, patt, BpS, color);

img2 = ChannelsUnite(vecvec, width, height, patt, BpS, color);

cmp = std::lexicographical_compare(img.begin(),img.end(),img2.begin(),img2.end());

try{
    img2 = Pattern(img2, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

try{
img2 = Demosaic(img2, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

std::string strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.png";

WriteToFormat(strw, height, width, color, img2);

#endif

#if 0
Exiv2::Image::UniquePtr image = Exiv2::ImageFactory::open(MyFile.c_str());
if (image.get() == 0) //check image path
{
    std::cout << "Can't read exif" << std::endl;
    return 2;
}

image->readMetadata();
Exiv2::ExifData ed = image->exifData();//get exif information

if (ed.empty())
{
    std::cout << "There is no exif info!" << std::endl;
    return 2;
}

printExif(ed);

int color;
int width = stoi(FindExifValue(ed, "Exif.Image.ImageWidth"));
int height = stoi(FindExifValue(ed, "Exif.Image.ImageLength"));
int BpS = stoi(FindExifValue(ed, "Exif.Image.BitsPerSample"));
int StripOffsets = stoi(FindExifValue(ed, "Exif.Image.StripOffsets"));

std::string patternstr = FindExifValue(ed, "Exif.Image.CFAPattern");
int patt;

if (patternstr[0] == '1' && patternstr[2] == '0' && patternstr[4] == '2' && patternstr[6] == '1')
{
    patt = static_cast<int>(Pattern::grbg);
    color = 3;
}

std::vector<unsigned char> img;

img = ReadFromDNG(MyFile, height, width, StripOffsets ,BpS);

img = color_8bit(img, BpS, 0.5);

img = ChannelsSep(img, width, height, patt, color);

std::string strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\qoitest.qoi";

WriteToFormat(strw, height, width, color, img);

std::string strr = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\qoitest.qoi";

img = ReadFromFormat(strr, height, width, color);

img = ChannelsUnite(img, width, height, patt, color);

try{
    img = Pattern(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

try{
img = Demosaic(img, width, height, patt, color);
}
catch (const char * errmsg)
{
    std::cout << errmsg << "\n";
}

strw = "C:\\Users\\minec\\Desktop\\RawImage\\QOI\\test1.png";

WriteToFormat(strw, height, width, color, img);
#endif

return 0;
}


