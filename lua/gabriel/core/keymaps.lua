-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

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

-- competitive programming
keymap.set("n", "<F3>", "<cmd>:w<CR>", { desc = "Save" }) --  save
keymap.set("i", "<F3>", "<cmd>:w<CR>", { desc = "Save" }) --  save

keymap.set("n", "<leader>cc", "<ESC>")

keymap.set(
	"n",
	"<F9>",
	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt <CR>',
	{ desc = "Compile, run C++ code and DON'T save output" }
) -- F9 to compile and run, but we don't use an output.txt file
keymap.set(
	"i",
	"<F9>",
	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt <CR>',
	{ desc = "Compile, run C++ code and DON'T save output" }
) -- F9 to compile and run, but we don't use an output.txt file

keymap.set(
	"n",
	"<F10>",
	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt > ~/Desktop/CP_Problems/First_Semester/Contests/output.txt <CR>',
	{ desc = "Compile and run C++ code and save output" }
) -- F10 to compile and run, but we use an output.txt file

keymap.set(
	"i",
	"<F10>",
	'<ESC> :w<CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o out "%" && ./out < ~/Desktop/CP_Problems/First_Semester/Contests/input.txt > ~/Desktop/CP_Problems/First_Semester/Contests/output.txt <CR>',
	{ desc = "Compile and run C++ code and save output" }
) -- F10 to compile and run, but we use an output.txt file
