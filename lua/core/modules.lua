local fn = vim.fn
local config_path = fn.stdpath("config") .. "/lua/functionalities.lua"

-- If file does not exist, create it with default content
if fn.filereadable(config_path) == 0 then
  local default_content = [[
-- List of enabled functionalities
-- All functionalities are: cpp, python, latex, git, rust
-- Example: return { "cpp", "python", "latex" }
return { "cpp" }
]]
  fn.writefile(vim.split(default_content, "\n"), config_path)
end

-- Load the functionalities list
local ok, features = pcall(require, "functionalities")
if not ok or type(features) ~= "table" then
  features = {}
end

-- Create global table with booleans
_G.Functionalities = {}
for _, feature in ipairs(features) do
  _G.Functionalities[feature] = true
end
