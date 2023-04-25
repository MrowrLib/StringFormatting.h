# `#include <string_format>`

```cpp
#include <string_format>

void Example() {
    auto text = string_format("Super {}", "Easy");
}
```

## What?

Simply passes the arguments to `std::format()` or `fmt::format()`.

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

#### `CMakeLists.txt`

```cmake
add_executable(Example main.cpp)

# Find string_format and link it to your target
find_package(string_format CONFIG REQUIRED)
target_link_libraries(Example PRIVATE string_format::string_format)

# If you're using C++20, you won't need fmt
target_compile_features(Example PRIVATE cxx_std_20)

# Else, add 'fmt' as a dependency
find_package(fmt CONFIG REQUIRED)
target_link_libraries(Example PRIVATE fmt::fmt)
```

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

#### `vcpkg-configuration.json`

```json
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/microsoft/vcpkg.git",
        "baseline": "95252eadd63118201b0d0df0b4360fa613f0de84"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/MrowrLib/Packages.git",
            "baseline": "6e1884a73e89d614682de6c28107ef888d99f8a1",
            "packages": ["mrowr-string-format"]
        }
    ]
}
```

> _Update the default-registry baseline to the latest commit from https://github.com/microsoft/vcpkg_  
> _Update the MrowrLib/Packages baseline to the latest commit from https://github.com/MrowrLib/Packages_

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
