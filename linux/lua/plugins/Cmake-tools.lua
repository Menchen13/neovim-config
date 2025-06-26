return {
    'Civitasv/cmake-tools.nvim',
    lazy = true,
    ft = { 'c', 'cpp', 'h', 'hpp', 'cmake' },
    opts = {
        cmake_build_options = { "--parallel" },
        cmake_regenerate_on_save = false,
        cmake_build_directory = "build",
        cmake_executor = { name = 'toggleterm' },
        cmake_runner = { name = 'toggleterm' }

    },
    keys = {
        {
            "<leader>cb",
            function()
                vim.cmd("CMakeBuild")
            end,
            desc = "CMake Build",
        },
        {
            "<leader>cg",
            function()
                vim.cmd("CMakeGenerate")
            end,
            desc = "CMake Generate",
        },
        {
            "<leader>cr",
            function()
                vim.cmd("CMakeRun")
            end,
            desc = "CMake Run",
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
