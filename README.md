# `#include <string_format>`

```cpp
#include <string_format>

void Example() {
    auto text = string_format("Super {}", "Easy");
}
```

## Installation

### xmake

#### `xmake.lua`

```lua
add_repositories("MrowrLib https://github.com/MrowrLib/Packages.git")
add_requires("string_format")

-- If you're using C++20, you won't need fmt
set_languages("c++20")

-- Else, add 'fmt' as a dependency
add_requires("fmt")

target("Example")
    add_packages("string_format")
    add_packages("fmt") -- if using 'fmt'
```

### vcpkg

#### `vcpkg-configuration.json`

```json
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/microsoft/vcpkg.git",
        "baseline": "501db0f17ef6df184fcdbfbe0f87cde2313b6ab1"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/MrowrLib/Packages.git",
            "baseline": "70e5df9d32678690c9966c193dfdbb10e27f10f8",
            "packages": ["mrowr-string-format"]
        }
    ]
}
```

> _Update the default-registry baseline to the latest commit SHA from https://github.com/microsoft/vcpkg_

#### `vcpkg.json`

```json
{
    "dependencies": ["mrowr-string-format"]
}
```

And if you want to use `fmt`:

```json
{
    "dependencies": ["mrowr-string-format", "fmt"]
}
```

#### `CMakeLists.txt`

```cmake
find_path(MROWR_STRING_FORMAT_INCLUDE_DIRS "string_format")

add_executable(Example main.cpp)

target_include_directories(Example INTERFACE ${MROWR_STRING_FORMAT_INCLUDE_DIRS})

# If you're using C++20, you won't need fmt
target_compile_features(Example PRIVATE cxx_std_20)

# Else, add 'fmt' as a dependency
find_package(fmt CONFIG REQUIRED)
target_link_libraries(Example PRIVATE fmt::fmt)
```

## What?

Simply passes the arguments to `std::format()` or `fmt::format()`.

## Why?

I got _really_ tired of switching between `fmt::format` and `std::format`.

> e.g. because only certain C++ versions and compilers support `std::format`.

## How?

If `fmt` headers are detected, then `fmt::format` is used.

Else `std::format` is used (_which will explode in C++ versions below C++20_).

## License

Use however, no attribution required.

```
BSD Zero Clause License (SPDX: 0BSD)

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
THIS SOFTWARE.
```
