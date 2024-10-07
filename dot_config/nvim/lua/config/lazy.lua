-- Bootstrap lazy.nvim
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

require('core.globals')
require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.helpers')

local opts = {
    defaults = {
        lazy = true,
    },
    -- colorscheme that will be used when installing plugins.
    install = {
        colorscheme = { "catpuccin" }
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        }
    },
    change_detection = {
        notify = false,
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true
    },
}

-- Setup lazy.nvim
require("lazy").setup('plugins', opts)