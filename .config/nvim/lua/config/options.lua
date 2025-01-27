local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- sync system clipboard and neovim (only set clipboard if not in ssh, to make OSC 52 works)

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.linebreak = true -- Companion to wrap, don't split words (default: false)
opt.breakindent = true -- Enable break indent (default: false)

opt.confirm = true

opt.showmode = false
opt.laststatus = 3

opt.scrolloff = 4
opt.sidescrolloff = 20

opt.spelllang = { "en" }

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true

opt.virtualedit = "block"

opt.mouse = "a"

opt.list = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

opt.undofile = true
opt.undolevels = 10000

opt.iskeyword:append("-")

opt.completeopt = "menu,menuone,noselect"

opt.updatetime = 200

opt.numberwidth = 2

opt.showtabline = 2

opt.conceallevel = 1
