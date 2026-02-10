local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Function to check if cursor is inside a math block
local function in_math()
  local node = vim.treesitter.get_node()
  while node do
    local type = node:type()
    -- Check for Typst math nodes
    if type == "math" or type == "inline_math" or type == "display_math" or type:match("math") then
      return true
    end
    node = node:parent()
  end
  return false
end

return {
  -- mk: inline math $$
  s({
    trig = "mk",
    snippetType = "autosnippet",
  }, {
    t("$"),
    i(1),
    t("$"),
  }),

  -- dk: display math $\n  \n$
  s({
    trig = "dm",
    snippetType = "autosnippet",
  }, {
    t({ "$", "  " }),
    i(1),
    t({ "", "$" }),
  }),

  -- vec: arrow()
  s({
    trig = "vec",
    snippetType = "autosnippet",
    condition = in_math,
    show_condition = in_math,
  }, {
    t("arrow("),
    i(1),
    t(")"),
  }),

  -- #npg: #pagebreak()
  s({
    trig = "#NPG",
    snippetType = "autosnippet",
  }, {
    t({ "#pagebreak()" }),
  }),
}
