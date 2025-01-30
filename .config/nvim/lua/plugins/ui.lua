-- fuzzy finder, file tree, dashboard, status lines & message,
-- scroll bar & git integration, colorscheme plugins

return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--trim",
          "--glob",
          "!.git/",
        },
        file_ignore_patterns = {
          "node_modules",
          "build",
          "dist",
          "pnpm-lock.yaml",
          "target",
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/" },
        },
      },
    },
    keys = {
      { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<leader>fr", "<cmd>Telescope old_files<cr>", desc = "Telescope find recent files" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" } },
      { "<leader>b/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Telescope current buffer live grep" } },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope find buffer" } },
      { "<leader>fc", "<cmd>Telescope command_history<cr>", { desc = "Telescope command history" } },
      { "<leader>fC", "<cmd>Telescope colorscheme<cr>", { desc = "Telescope change colorscheme" } },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
  },

  -- file tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
      { "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Git Explorer NeoTree" },
      { "<leader>be", "<cmd>Neotree buffers<cr>", desc = "Buffer Explorer NeoTree" },
    },
    opts = {
      window = {
        position = "right",
        width = "30",
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            "node_modules",
            ".git",
          },
          never_show = {
            ".DS_Store",
          },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            unstaged = "󰄱",
            staged = "󰱒",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.relativenumber = true
          end,
        },
      },
    },
  },

  -- dashboard
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {

      dashboard = { enabled = true, example = "compact_files" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() Snacks.bufdelete() end,           desc = "Delete Buffer" },
      { "<leader>bo", function() Snacks.bufdelete.other() end,     desc = "Delete Other Buffers" },
    },
  },

  -- status line & message
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<S-h>", "<cmd>bprevious<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>bnext<cr>", desc = "Next Buffer" },
      { "<leader>bD", "<cmd>:bd<cr>", desc = "Delete Buffer and Window" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    },
    opts = {
      options = {
        separator_style = "slant",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = {
          {
            "macro",
            fmt = function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return "recording @" .. reg
              end
              return nil
            end,
            color = { fg = "#ff9364" },
            draw_empty = false,
          },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {},
    keys = {
      { "<leader>nh", "<cmd>Noice history<cr>", desc = "Notification History" },
      { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss All Notifications" },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      top_down = false,
      fps = 60,
    },
  },

  -- git integration & scroll bar
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      -- stylua: ignore
    },
    keys = {
      { "[h", "<cmd>Gitsigns nav_hunk prev<cr>", desc = "Previous Hunk" },
      { "]h", "<cmd>Gitsigns nav_hunk next<cr>", desc = "Next Hunk" },
      { "<leader>ghp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview Hunk Inline" },
      { "<leader>ghd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff This" },
      { "ih", "<cmd>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "GitSigns Select Hunk" },
    },
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar").setup()
    end,
  },

  -- colorscheme
  {
    "lunarvim/lunar.nvim",
    -- priority = 1000,
    -- config = function()
    --   require("lunar").setup()
    --   vim.cmd.colorscheme("lunar")
    -- end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
