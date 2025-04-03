return {
    'Civitasv/cmake-tools.nvim', lazy = true, ft = {'c', 'cpp', 'h', 'hpp', 'cmake'} , opts = {
        cmake_build_options = {"--parallel"},
        cmake_kits_path = 'C:/Users/Menchen/OneDrive/Desktop/tmp/cmake-tools-kits.json', -- very important that the generator is in "": "\"MinGW Makefiles\""
        cmake_regenerate_on_save = false,
        cmake_build_directory = "build",
        cmake_soft_link_compile_commands = false, -- doesnt work on windows, softlinks need admin for some reason. sourcing the file in clangd directly
        cmake_executor = {name = 'toggleterm'},
        cmake_runner = {name = 'toggleterm'}

    },
    keys = {
        {
            "<leader>cb",
            function()
                vim.cmd("CMakeBuild")
            end,
            desc = "CMake Build",
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
