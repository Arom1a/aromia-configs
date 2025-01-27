return {
  -- mdx syntax highlighting
  {
    "davidmh/mdx.nvim",
    event = "BufEnter *.mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("mdx").setup()
    end,
  },
}
