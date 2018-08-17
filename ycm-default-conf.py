#! /usr/bin/env python2
import os

default_cflags = ['-xc', '-std=c99', '-D_GNU_SOURCE', '-I/usr/include/libxml2']
default_cxxflags = ['-xc++', '-std=c++11', '-D_GNU_SOURCE', '-I/usr/include/libxml2', '-I/opt/opencv3/include', '/opt/opencv3/include/']

def FlagsForFile(filename, **kwargs):
    try:
        with open(os.path.dirname(filename) + '/.clang_complete') as f:
            content = [l.strip() for l in f.readlines()]
        def_cflags = ['-xc'] + content
        def_cxxflags = ['-xc++'] + content
    except:
        def_cflags = default_cflags
        def_cxxflags = default_cxxflags

    ext = os.path.splitext(filename)[1]
    if ext in ['.h', '.c']:
        flags = def_cflags
    elif ext in ['.cpp', '.cxx', '.cc', '.hpp', '.hh']:
        flags = def_cxxflags
    return {
        'flags': flags,
        'do_cache': True
    }
