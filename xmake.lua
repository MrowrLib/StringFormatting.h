set_languages("c++23")
add_rules("mode.debug")
set_toolchains("msvc")

option("use_fmt")
    add_defines("STRING_FORMATTING_USE_FMT")
    set_description("Enable fmt::format (instead of std::format)")
    set_showmenu(true)
    set_default(false)

package("StringFormatting")
    set_homepage("https://github.com/MrowrLib/StringFormatting.h")
    set_description("A header-only string formatting library")
    set_kind("headeronly")
    on_install(function(package)
        os.cp("include", package:installdir("include"))
    end)
    on_fetch(function(package, opt)
        if opt.system then
            return
        end

        return {includedirs = {package:installdir("include")}}
    end)

target("Example")
    set_kind("binary")
    add_files("Example.cpp")
    add_packages("StringFormatting")
    add_options("use_fmt")
