add_rules("mode.debug")

set_toolchains("msvc")

-- add_requires("vcpkg::fmt")

set_languages("c++23")

add_includedirs("include") -- FIXME gross!

target("StringFormatting")
    set_kind("phony")
    add_headerfiles("include/(**.h)")
    add_includedirs("include")

target("Example")
    set_kind("binary")
    add_files("Example.cpp")
    set_targetdir("bin")
    add_deps("StringFormatting")

    -- add_packages("vcpkg::fmt")