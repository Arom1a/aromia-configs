return {
  "nvim-telescope/telescope.nvim",
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
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/" },
      },
    },
  },
}
