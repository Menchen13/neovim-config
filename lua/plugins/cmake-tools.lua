if not Functionalities.cpp then
    return {}
end


return {
    'Civitasv/cmake-tools.nvim',
    lazy = true,
    ft = { 'c', 'cpp', 'h', 'hpp', 'cmake' },
    opts = function()
        local opts = {
            cmake_build_options = { '--parallel' },
            generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1", '-G "MinGW Makefiles"' },
            cmake_regenerate_on_save = false,
            use_preset = false,
            cmake_executor = { name = 'toggleterm' },
            cmake_runner = { name = 'toggleterm' },
        }

        -- Windows cant support the default softlink option so copy is used
        if IS_WINDOWS then
            opts.cmake_compile_commands_options = { action = "copy" }
        end

        return opts
    end,
    keys = {
        {
            "<leader>cb",
            function()
                vim.cmd("CMakeBuild")
            end,
            desc = "CMakeBuild",
        },
        {
            "<leader>cg",
            function()
                vim.cmd("CMakeGenerate")
            end,
            desc = "CMakeGenerate",
        },
        {
            "<leader>cr",
            function()
                vim.cmd("CMakeRun")
            end,
            desc = "CMakeRun",
        },
        {
            "<leader>cs",
            function()
                vim.cmd("CMakeSelectBuildType")
            end,
            desc = "CMakeSelectBuildType",

        },
        {
            "<leader>ct",
            function()
                vim.cmd("CMakeRunTest")
            end,
            desc = "CMakeRunTest",
        },
    },
}

--[[ example kit from my homePC
[
  {
    "name": "GCC 11.2.0 x86_64-w64-mingw32",
    "generator": "\"MinGW Makefiles\"",
    "compilers": {
      "C": "C:\\Users\\Menchen\\MinGW\\bin\\gcc.exe",
      "CXX": "C:\\Users\\Menchen\\MinGW\\bin\\g++.exe"
    },
    "isTrusted": true,
    "environmentVariables": {
      "CMT_MINGW_PATH": "C:\\Users\\Menchen\\MinGW\\bin"
    }

  }
] ]]
