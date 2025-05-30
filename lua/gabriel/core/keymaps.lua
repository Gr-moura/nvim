-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Have j and k navigate visual lines rather than logical ones
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- floaterm
keymap.set(
	"n",
	"<leader>ot",
	"<cmd>FloatermNew --height=0.5 --width=0.8 --wintype=float --title=Gabriel <CR>",
	{ desc = "Open terminal" }
) --  open terminal

keymap.set("t", "<F1>", "<cmd>FloatermToggle<CR>", { desc = "Hide terminal" }) --  hide terminal
keymap.set("n", "<F1>", "<cmd>FloatermToggle<CR>", { desc = "Show terminal" }) --  show terminal
keymap.set({ "t", "n" }, "<F2>", "<cmd>FloatermKill<CR>", { desc = "Kill terminal" }) -- kill terminal

-- UFMG
keymap.set(
	{ "n", "i" },
	"<F12>",
	'<ESC> :w<CR> :!gcc -fsanitize=address -pedantic -Wall -Wextra -Wshadow -DONPC -O2 -o zzz "%" && ./zzz <CR>',
	{ desc = "Compile and run C code" }
)

keymap.set(
	{ "n", "i" },
	"<F11>",
	'<ESC> :w<CR> :!g++ -std=c++11 -pedantic -fsanitize=address -Wall -Wextra -Wshadow -DONPC -O2 -o zzz "%" && ./zzz <CR>',
	{ desc = "Compile and run C++ code" }
)

-- competitive programming
keymap.set({ "n", "i" }, "<F3>", "<cmd>:w<CR>", { desc = "Save" }) --  save

keymap.set("n", "<leader>ca", "<cmd>%y+<CR>", { desc = "Copy all" }) -- copy whole file
keymap.set("n", "<leader>ch", "<cmd>2,$y+<CR>", { desc = "Copy without header" }) -- copy from the second line onward

-- refactoring
keymap.set("x", "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end, { desc = "Extract Function" })
keymap.set("x", "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end, { desc = "Extract Function to File" })
-- Extract function supports only visual mode
keymap.set("x", "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end, { desc = "Extract Variable" })
-- Extract variable supports only visual mode
keymap.set("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end, { desc = "Inline Function" })
-- Inline func supports only normal
keymap.set({ "n", "x" }, "<leader>ri", function()
	require("refactoring").refactor("Inline Variable")
end, { desc = "Inline Variable" })
-- Inline var supports both normal and visual mode
keymap.set("x", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end, { desc = "Extract Block" })
keymap.set("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end, { desc = "Extract Block to File" })
-- Extract block supports only normal mode

-- keymap.set(
-- 	"n",
-- 	"<F10>",
-- 	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt > ~/Desktop/CP_Problems/First_Semester/Contests/output.txt <CR>',
-- 	{ desc = "Compile and run C++ code and save output" }
-- ) -- F10 to compile and run, but we use an output.txt file
--
-- keymap.set(
-- 	"i",
-- 	"<F10>",
-- 	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt > ~/Desktop/CP_Problems/First_Semester/Contests/output.txt <CR>',
-- 	{ desc = "Compile and run C++ code and save output" }
-- ) -- F10 to compile and run, but we use an output.txt file

--keymap.set("n", "<leader>lo", compile_and_open_the_pdf, {desc = "Compile tex file and open the pdf"})
--keymap.set({ "<leader>lc", "<cmd>VimtexCompile<CR>", desc = "Compile tex file" })
--keymap.set({ "<leader>ls", "<cmd>VimtexCompileOutput<CR>", desc = "Show output of the tex compiler" })
--keymap.set({ "<leader>lv", "<cmd>VimtexView<CR>", desc = "View tex pdf" })

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>Bn", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>Bc", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<leader>Dr", function()
	require("dap").repl.open()
end, { desc = "Open Debug Console" })
vim.keymap.set("n", "<leader>Dl", function()
	require("dap").run_last()
end, { desc = "Run Last Debug Session" })
vim.keymap.set("n", "<leader>Dx", function()
	require("dap").terminate()
end, { desc = "Terminate Debugging" })
vim.keymap.set("n", "<leader>Du", function()
	require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
