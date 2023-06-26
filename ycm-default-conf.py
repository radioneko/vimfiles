#! /usr/bin/env python2
import os

def inc_path(p):
    if p[0] == '/':
        return p
    else:
        return '/usr/include/' + p

common_inc = ['-I' + inc_path(x) for x in ['libxml2', 'hs', 'apr-1']]

default_cflags = ['-xc', '-std=c99', '-D_GNU_SOURCE', ] + common_inc
default_cxxflags = ['-xc++', '-std=c++1z', '-D_GNU_SOURCE', '-I/opt/opencv3/include'] + common_inc

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
