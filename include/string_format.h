#pragma once

#if __has_include(<format>)
    #include <format>
    #define string_format(...) std::format(__VA_ARGS__)
#elif __has_include(<fmt/format.h>)
    #include <fmt/format.h>
    #define string_format(...) fmt::format(__VA_ARGS__)
#else
    #error "No string_format library found (fmt or std::format)"
#endif
