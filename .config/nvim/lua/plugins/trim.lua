return {
  "cappyzawa/trim.nvim",
  config = function()
    require("trim").setup({
      highlight = true,
      highlight_bg = "#808090",
    })
  end,
}
