-- snippets

return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      ls.setup({
        enable_autosnippets = true,
      })
      -- Load typst snippets
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/plugins/snippets" })
    end,
  },
}
