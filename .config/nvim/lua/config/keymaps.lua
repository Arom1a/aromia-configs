local k = vim.keymap

-- lazy
k.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- better up and down
k.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
k.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
k.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
k.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- <ctrl> + s for saving file
k.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- <ctrl> + hjkl for window movement
k.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
k.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
k.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
k.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- clear search highlights
k.set("n", "<leader>nl", "<cmd>nohlsearch<cr>", { desc = "Clear Search Results" })

-- <ctrl> + arrow keys for window resizing
k.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
k.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
k.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
k.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- <alt> + jk for moving lines
k.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
k.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
k.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
k.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
k.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
k.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- better indenting
k.set("v", "<", "<gv")
k.set("v", ">", ">gv")

-- keep last yanked pasting
k.set("v", "p", '"_dP')

-- window management
k.set("n", "<leader>w", "<C-w>", { desc = "Windows", remap = true })
k.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
k.set("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })
k.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- tabs
k.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
k.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
k.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
k.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
k.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- quit
k.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- add undo break-points
k.set("i", ",", ",<c-g>u")
k.set("i", ".", ".<c-g>u")
k.set("i", ";", ";<c-g>u")

-- commenting
k.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
k.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- previous and next
k.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
k.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
k.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
k.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
k.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
k.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
k.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
k.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
k.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
k.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
k.set("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
k.set("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
