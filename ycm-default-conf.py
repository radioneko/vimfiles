import os

default_cflags = ['-xc', '-std=c99', '-D_GNU_SOURCE', '-I/usr/include/libxml2']
default_cxxflags = ['-xc++', '-std=c++11', '-D_GNU_SOURCE', '-I/usr/include/libxml2']

def FlagsForFile(filename, **kwargs):
    ext = os.path.splitext(filename)
    if ext in ['.h', '.c']:
        flags = default_cflags
    elif ext in ['.cpp', '.cxx', '.cc', '.hpp']:
        flags = default_cxxflags
    return {
        'flags': ['-D_GNU_SOURCE'],
        'do_cache': True
    }
