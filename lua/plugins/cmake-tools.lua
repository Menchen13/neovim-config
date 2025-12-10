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
      cmake_generate_options = { "-GNinja", "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_regenerate_on_save = false,
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
      "<leader>cB",
      function()
        vim.cmd("CMakeSelectBuildTarget")
      end,
      desc = "Select CMakeBuild Target",
    },
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
      "<leader>cR",
      function()
        vim.cmd("CMakeSelectLaunchTarget")
      end,
      desc = "Select CMakeRun Target",
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
        local cwd = vim.fn.getcwd()
        local files = vim.fn.glob(cwd .. "/conanfile.*", false, true)

        if next(files) ~= nil then
          vim.cmd("CMakeSelectConfigurePreset")
        else
          vim.cmd("CMakeSelectBuildType")
        end
      end,
      desc = "Select BuildType with conan detection",

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
