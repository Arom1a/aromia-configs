-- tressiter, lsp, formating

return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = vim.fn.argc(-1) == 0,
    event = "BufReadPre",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "black",
        "clang-format",
        "clangd",
        "cpptools",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "html-lsp",
        "isort",
        "json-lsp",
        "lua-language-server",
        "markdown-oxide",
        "prettierd",
        "python-lsp-server",
        "rust-analyzer",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "yaml-language-server",
        "yamlfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "super-tab",
        cmdline = { preset = "enter" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        cmdline = {},
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = { "saghen/blink.cmp", "neovim/nvim-lspconfig" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- https://github.com/rust-lang/rust-analyzer/issues/13529#issuecomment-1660862875
      local function get_project_rustanalyzer_settings()
        local handle = io.open(vim.fn.resolve(vim.fn.getcwd() .. "/./.rust-analyzer.json"))
        if not handle then
          return {}
        end
        local out = handle:read("*a")
        handle:close()
        local config = vim.json.decode(out)
        if type(config) == "table" then
          return config
        end
        return {}
      end

      require("mason-lspconfig").setup({})

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["lua_ls"] = function(server_name)
          require("lspconfig")[server_name].setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
            capabilities = capabilities,
          })
        end,

        ["rust_analyzer"] = function(server_name)
          require("lspconfig")[server_name].setup({
            settings = {

              ["rust-analyzer"] = vim.tbl_deep_extend(
                "force",
                {
                  -- Defaults (can be overridden by .rust-analyzer.json)
                },
                get_project_rustanalyzer_settings(),
                {
                  -- Overrides
                }
              ),
            },
            capabilities = capabilities,
          })
        end,

        ["clangd"] = function(server_name)
          require("lspconfig")[server_name].setup({
            cmd = {
              "clangd",
              "--header-insertion=never",
            },
            capabilities = capabilities,
          })
        end,
      })
    end,
  },

  -- formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          astro = { "prettierd", "prettier" },
          html = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          javascript = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          json = { "prettierd", "prettier" },
          rust = { "rustfmt" },
          bash = { "shfmt" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
