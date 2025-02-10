# MiniLibC - A Minimalistic C Standard Library Replacement

## Overview

MiniLibC is a dynamic ELF library designed to replace (to a certain extent) the standard C library used on your system. The library provides a subset of the standard C library functions, ensuring they adhere to the behavior specified in their respective man pages.

## Features

The following functions have been implemented in MiniLibC:

- **✓ `strlen`** - Calculate the length of a string.
- **✓ `strchr`** - Locate the first occurrence of a character in a string.
- **✓ `strrchr`** - Locate the last occurrence of a character in a string.
- **✓ `memset`** - Fill a block of memory with a particular value.
- **✓ `memcpy`** - Copy a block of memory from one location to another.
- **✓ `strcmp`** - Compare two strings.
- **✓ `memmove`** - Copy a block of memory, handling overlapping regions.
- **✓ `strncmp`** - Compare two strings up to a specified number of characters.
- **✓ `strcasecmp`** - Compare two strings case-insensitively.
- **✓ `strstr`** - Locate a substring within a string.
- **✓ `strpbrk`** - Find the first occurrence of any character from a set in a string.
- **✓ `strcspn`** - Calculate the length of the initial segment of a string that does not contain any characters from a specified set.

All functions are implemented to match the behavior described in their respective man pages.
