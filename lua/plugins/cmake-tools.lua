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
            cmake_regenerate_on_save = false,
            cmake_executor = { name = 'toggleterm' },
            cmake_runner = { name = 'toggleterm' },
        }

        if IS_WINDOWS then
            opts.cmake_kits_path = 'C:/Users/Menchen/OneDrive/Desktop/tmp/cmake-tools-kits.json'
            opts.cmake_compile_commands_options = { action = "copy" }
        elseif IS_LINUX then
            -- no kit path on linux, should be fine with everything being in PATH
            -- opts.cmake_soft_link_compile_commands = true
        end

        return opts
    end,
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
