#pragma once

#ifdef STRING_FORMATTING_USE_FMT
#include <fmt/format.h>
#define string_format(...) fmt::format(__VA_ARGS__)
#else
#include <format>
#define string_format(...) std::format(__VA_ARGS__)
#endif
