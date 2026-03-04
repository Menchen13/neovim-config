-- Require toggleterm Terminal
local Terminal = require("toggleterm.terminal").Terminal

local function conan_install()
  -- 1. Fetch available Conan profiles
  local profile_dir = vim.fn.expand("~/.conan2/profiles")
  local profiles = {}

  -- Check if the directory exists and read its contents
  if vim.fn.isdirectory(profile_dir) == 1 then
    profiles = vim.fn.readdir(profile_dir)
  end

  -- Fallback just in case the directory is empty or missing
  if #profiles == 0 then
    profiles = { "default" }
  end

  -- 2. Define build type choices
  local build_types = { "Debug", "Release", "RelWithDebInfo", "MinSizeRel" }

  -- 3. First Prompt: Ask user for the Conan profile
  vim.ui.select(profiles, { prompt = "Select Conan Profile:" }, function(profile_choice)
    if not profile_choice then return end -- Exit if user cancels

    -- 4. Second Prompt: Ask user for build type
    vim.ui.select(build_types, { prompt = "Select build type for Conan:" }, function(build_choice)
      if not build_choice then return end -- Exit if user cancels

      -- Match cmake-tools style output directories
      local build_dir = "out/" .. build_choice

      -- Conan command updated to include the selected profile (-pr)
      local cmd = string.format(
        "conan install . --build=missing -pr %s -s build_type=%s -of %s",
        profile_choice,
        build_choice,
        build_dir
      )

      -- Create a ToggleTerm terminal with the Conan command
      local term = Terminal:new({
        cmd = cmd,
        dir = vim.fn.getcwd(),
        close_on_exit = false,
        direction = "float", -- can be "float", "horizontal", "vertical"
      })

      -- Toggle it open (runs the command once)
      term:toggle()
    end)
  end)
end

-- Create user command
vim.api.nvim_create_user_command("ConanInstall", conan_install, {})
