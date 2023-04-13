# `#include <string_format>`

```cpp
#include <string_format>

void Example() {
    auto text = string_format("Super {}", "Easy");
}
```

## Installation

```lua
-- xmake
add_repositories("MrowrLib https://github.com/MrowrLib/Packages.git")
add_requires("string_format")
```

```cmake
# CMake/vcpkg (coming soon)
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
