-- quality of life plugins

return {
  -- trim trailing whitespaces and blank lines
  {
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup({
        highlight = true,
        highlight_bg = "#808090",
      })
    end,
  },

  -- smooth cursor
  {
    "sphamba/smear-cursor.nvim",
    enabled = not vim.g.neovide,
    opts = {},
  },

  -- highlight cursorword
  {
    "ya2s/nvim-cursorline",
    opts = {
      cursorword = {
        hl = {
          underline = true,
          bg = "#404060",
        },
      },
    },
  },

  -- auto complete pairs, eg: '',"",(),[],{}
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- auto detect buffer's indent size
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup()
    end,
  },

  -- beautiful indent guides
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        indent = {
          hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
          },
        },
      },
    },
  },

  -- beautiful delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      }
      vim.g.rainbow_delimiters = { highlight = hl }
    end,
  },

  -- other snacks.nvim
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = not vim.g.neovide },
      toggle = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() Snacks.bufdelete() end,           desc = "Delete Buffer" },
      { "<leader>bo", function() Snacks.bufdelete.other() end,     desc = "Delete Other Buffers" },
      { "<leader>gg", function() Snacks.lazygit() end,             desc = "Lazygit" },
      { "<leader>gl", function() Snacks.picker.git_log() end,      desc = "Git Log" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Current File History" },
      { "<leader>gb", function() Snacks.picker.git_log_line() end, desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end,           mode = { "n", "x" },    desc = "Git Browse (open)" },
      { "<leader>gY", function()
          Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, mode = { "n", "x" }, notify = false })
        end, desc = "Git Browse (copy)" },
    },
  },

  -- which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        {
          {
            mode = { "n", "v" },
            {
              "<leader>b",
              group = "buffers",
              expand = function()
                return require("which-key.extras").expand.buf()
              end,
            },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>n", group = "Noice" },
            { "<leader>q", group = "quit" },
            {
              "<leader>w",
              group = "windows",
              proxy = "<c-w>",
              expand = function()
                return require("which-key.extras").expand.win()
              end,
            },
            { "<leader><tab>", group = "tabs" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "z", group = "fold" },
          },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- better movement
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- colorize rgb colors, eg: #E6E6FA
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = {
        "*",
        css = { css = true },
      },
      user_default_options = {
        names = false,
        mode = "virtualtext",
        virtualtext = "  ",
        virtualtext_mode = "background",
      },
    },
  },

  -- vim surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- mdx syntax highlighting
  {
    "davidmh/mdx.nvim",
    event = "BufEnter *.mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("mdx").setup()
    end,
  },

  -- project management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },

  {
    "vidocqh/auto-indent.nvim",
    opts = {},
  },
}
