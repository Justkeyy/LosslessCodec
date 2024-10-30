#include "exifreader.h"
#include <iostream>

void printExif (Exiv2::ExifData & ed)
{
    Exiv2::ExifData::iterator it = ed.begin();

    while (it != ed.end())
    {
        std::cout << it->key() << " - " << it->value().toString() << std::endl;
        ++it;
    }
}

std::string FindExifValue(Exiv2::ExifData &ed, std::string key)
{
    Exiv2::ExifKey tmp = Exiv2::ExifKey(key);
    Exiv2::ExifData::iterator pos = ed.findKey(tmp);
    if (pos == ed.end())
    {
        return "Unknow";
    }
    return pos->value().toString();
}
