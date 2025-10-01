-- Require toggleterm Terminal
local Terminal = require("toggleterm.terminal").Terminal

local function conan_install()
  -- Build type choices
  local build_types = { "Debug", "Release", "RelWithDebInfo", "MinSizeRel" }

  -- Ask user for build type
  vim.ui.select(build_types, { prompt = "Select build type for Conan:" }, function(choice)
    if not choice then return end

    -- Match cmake-tools style output directories
    local build_dir = "out/" .. choice

    -- Conan command
    local cmd = string.format(
      "conan install . --build=missing -s build_type=%s -of %s",
      choice,
      build_dir
    )

    -- Create a ToggleTerm terminal with the Conan command
    local term = Terminal:new({
      cmd = cmd,
      dir = vim.fn.getcwd(),
      close_on_exit = false,
      direction = "float",  -- can be "float", "horizontal", "vertical"
    })

    -- Toggle it open (runs the command once)
    term:toggle()
  end)
end

-- Create user command
vim.api.nvim_create_user_command("ConanInstall", conan_install, {})

