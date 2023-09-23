package("libiup")
    set_kind("library")
    set_homepage("https://www.tecgraf.puc-rio.br/iup/")
    set_description("IUP is a multi-platform toolkit for building graphical user interfaces.")
    set_license("Tecgraf Library License / MIT license")

    if is_plat("windows") then
        if is_arch("x86") then
            add_urls("https://sourceforge.net/projects/iup/files/$(version)/Windows%20Libraries/Dynamic/iup-$(version)_Win32_dll16_lib.zip")
        else
            add_urls("https://sourceforge.net/projects/iup/files/$(version)/Windows%20Libraries/Dynamic/iup-$(version)_Win64_dll16_lib.zip")
        end
    elseif is_plat("mingw") then
        if is_arch("x86") then
            add_urls("https://sourceforge.net/projects/iup/files/$(version)/Windows%20Libraries/Dynamic/iup-$(version)_Win32_dllw6_lib.zip")
        else
            add_urls("https://sourceforge.net/projects/iup/files/$(version)/Windows%20Libraries/Dynamic/iup-$(version)_Win64_dllw6_lib.zip")
        end
    end

    local versions = {
        windows = {
            _3_30 = {
                x86 = "978b1e6523a80caaa0e5f88b4866a58682ea23ca3f85867760af36f11d28e19d",
                x64 = "10b7ea192c3fb6ca7493472ddbbffcbb4888b41053964e45802e171aa6f2e37c",
                x86_64 = "10b7ea192c3fb6ca7493472ddbbffcbb4888b41053964e45802e171aa6f2e37c",
            }
        },
        mingw = {
            _3_30 = {
                x86 = "74ddde20c5b1ec41a6fb1f1a292d52f70057768927a5f1cab94f60f70f5f82e0",
                x64 = "aea2ad93351233eeac8f921cf4cc1eef36ab33a88266489accb0ade28f8c3a0d",
                x86_64 = "aea2ad93351233eeac8f921cf4cc1eef36ab33a88266489accb0ade28f8c3a0d",
            }
        }
    }

    for plat, versions in pairs(versions) do
        if is_plat(plat) then
            for version, archs in pairs(versions) do
                for arch, hash in pairs(archs) do
                    if is_arch(arch) then
                        add_versions(version:sub(2):gsub("_","."), hash)
                    end
                end
            end
        end
    end

    on_load(function (package) 
        package:config_set("shared", true)
    end)

    on_install("windows", "mingw", function (package)
        os.cp("*.a", package:installdir("lib"))
        os.cp("*.dll", package:installdir("lib"))
        os.cp("include/*", package:installdir("include"))
        package:add("links", "iup")
    end)
