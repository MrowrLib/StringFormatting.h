#pragma once

#if defined(STRING_FORMAT_USE_STD) ||                                                \
    (!defined(STRING_FORMAT_USE_FMT) &&                                              \
     ((defined(_MSVC_LANG) && _MSVC_LANG >= 202002L) || (__cplusplus >= 202002L)) && \
     __has_include(<format>))
    #include <format>
    #define string_format(...) std::format(__VA_ARGS__)
#elif defined(STRING_FORMAT_USE_FMT) || __has_include(<fmt/format.h>)
    #include <fmt/format.h>
    #define string_format(...) fmt::format(__VA_ARGS__)
#else
    #error "No string_format library found (fmt or std::format)"
#endif
