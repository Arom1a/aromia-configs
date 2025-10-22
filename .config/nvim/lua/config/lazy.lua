require("config.leaders")

require("config.autocmds")
require("config.keymaps")
require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- VSCode Neovim
if vim.g.vscode then
  vim.cmd([[
    map j gj
    map k gk
    "map <Down> gj
    "map <Up> gk
  ]])

  require("lazy").setup({
    spec = { { import = "vscode-plugins" } },
    defaults = { version = "*" },
    checker = { enabled = true },
  })

  return
end

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.lang" },
  },
  defaults = {
    -- try installing the latest stable version for plugins
    version = "*",
  },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
