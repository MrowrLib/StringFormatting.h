cadd_rules("mode.debug")
set_toolchains("msvc")
set_languages("c++23")
add_requires("fmt")

option("use_fmt")
    add_defines("STRING_FORMATTING_USE_FMT")
    set_description("Enable fmt::format (instead of std::format)")
    set_showmenu(true)
    set_default(false)

target("StringFormatting")
    set_kind("library") -- Change this to library
    add_files("include/*.h")
    add_headerfiles("include/(**.h)", {prefixdir = "StringFormatting"})
    add_includedirs("include", {public = true})

target("Example")
    set_kind("binary")
    add_files("Example.cpp")
    add_deps("StringFormatting")
    add_imports("StringFormatting")
    add_packages("fmt")
    add_options("use_fmt")
