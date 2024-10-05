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

-- I like using H and L for beginning/end of line
keymap.set("n", "H", "^", { desc = "Go to beginning of line" })
keymap.set("n", "L", "$", { desc = "Go to end of line" })

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
	'<ESC> :w<CR> :!gcc -fsanitize=address -Wall -Wextra -Wshadow -DONPC -O2 -o zzz "%" && ./zzz <CR>',
	{ desc = "Compile and run C code" }
)

keymap.set(
	{ "n", "i" },
	"<F11>",
	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++11 -Wall -Wextra -Wshadow -DONPC -O2 -o zzz "%" && ./zzz <CR>',
	{ desc = "Compile and run C++ code" }
)

-- competitive programming
keymap.set({ "n", "i" }, "<F3>", "<cmd>:w<CR>", { desc = "Save" }) --  save

keymap.set("n", "<leader>ca", "<cmd>%y+<CR>", { desc = "Copy all" }) -- copy whole file

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
