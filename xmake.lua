add_rules("mode.debug")
set_toolchains("msvc")

-- set to c++20 for <format> support
set_languages("c++14")

-- fmt is only required for the example
add_requires("fmt")

target("string_format")
    set_kind("headeronly")
    add_headerfiles("include/(**.h)")
    add_includedirs("include", {public = true})

target("Example")
    set_kind("binary")
    add_files("Example.cpp")
    add_deps("string_format")
    add_packages("fmt")
