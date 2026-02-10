return {
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    opts = {
      port = 40585,
      invert_colors = '{"rest": "always","image": "never"}',
      follow_cursor = false,
      dependencies_bin = { ["tinymist"] = "tinymist" },
    },
  },
}
