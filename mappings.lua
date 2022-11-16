local M = {}

-- n: Normal
-- v: Visual
-- x: Visual Line

local config = require("core.utils").load_config()

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local xpr = {noremap = true, expr = true}

--[[
M.colemak = {
  n = {
   ["n"] = { "j", "Cursor down" }
   ["e"] = { "k", "Cursor up" }
   ["i"] = { "l", "Cursor right" }
   ["u"] = { "i", "Insert mode" },
   ["U"] = { "I", "" },
   ["l"] = { "u", "" },
   ["gl"] = { "u", "" },
   ["<C-W>h"] = { "<C-W>h", "" },
   ["<C-W>n"] = { "<C-W>j", "" },
   ["<C-W>e"] = { "<C-W>k", "" },
   ["<C-W>i"] = { "<C-W>k", "" },
   ["<leader>ss"] = { ":sp<space>", "" },
   ["<leader>vs"] = { ":vsp<space>", "" },
   ["<C-t>"] = { "<Esc>:tabnew<CR>", "" }, 
   ["<S-T>"] = { "<Esc><C-w>T", "" }
   ["te"] = { ":tabnext<CR>", "" },
   ["tn"] = { ":tabprev<CR>", "" },
   ["th"] = { ":tabfirst<CR>", "" },
   ["ti"] = { ":tablast<CR>", "" },
   ["<leader><space>"] = { ":set hlsearch!<CR>", "" },
   ["<leader>sl"] = { ":set wrap linebreak<CR>", "" },
   ["gV"] = { "`[v]`", "" },
   ["<leader>spl"] = { ":set spell spelllang=en_us<CR>", "" },
   ["<leader>nspl"] = { ":set nospell<CR>", "" },
   ["<leader>S"] = { ":FixWhitespace<CR>", "" },
  }
  
  x = {
   ["n"] = { "j", "" },
   ["e"] = { "k", "" },
   ["i"] = { "l", "" },
   ["u"] = { "i", "" },
   ["U"] = { "I", "" },
   ["l"] = { ":<C-U>undo<CR>", "" },
   ["gl"] = { ":<C-U>undo<CR>", ""},
   ["<C-W>n"] = { "<C-W>j", "" },
   ["<C-W>h"] = { "<C-W>h", "" },
   ["<C-W>i"] = { "<C-W>k", "" },
   ["<C-W>e"] = { "<C-W>k", "" },
  }

  o = {
   ["n"] = { "j", "" },
   ["e"] = { "k", "" },
   ["i"] = { "l", "" },
   ["u"] = { "i", "" },
   ["U"] = { "I", "" },
  }
}
]]--

local config = require("core.utils").load_config()

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local xpr = {noremap = true, expr = true}

-- Colemak Keybindings {{{
   ----------------------
   map('n', 'n', 'j', opts)
   map('x', 'n', 'j', opts)
   map('o', 'n', 'j', opts)
   map('n', 'e', 'k', opts)
   map('x', 'e', 'k', opts)
   map('o', 'e', 'k', opts)
   map('n', 'i', 'l', opts)
   map('x', 'i', 'l', opts)
   map('o', 'i', 'l', opts)

  -- Colemak Insert
   map('n', 'u', 'i', opts)
   map('n', 'U', 'I', opts)
   map('x', 'u', 'i', opts)
   map('x', 'U', 'I', opts)
   map('o', 'u', 'i', opts)
   map('o', 'U', 'I', opts)

   -- Undo/redo
   map('n', 'l', 'u', opts)
   map('x', 'l', ':<C-U>undo<CR>', opts)
   map('n', 'gl', 'u', opts)
   map('x', 'gl', ':<C-U>undo<CR>', opts)

   -- Colemak Windows
   map('n', '<C-W>h', '<C-W>h', opts)
   map('x', '<C-W>h', '<C-W>h', opts)
   map('n', '<C-W>n', '<C-W>j', opts)
   map('x', '<C-W>n', '<C-W>j', opts)
   map('n', '<C-W>e', '<C-W>k', opts)
   map('x', '<C-W>e', '<C-W>k', opts)
   map('n', '<C-W>i', '<C-W>k', opts)
   map('x', '<C-W>i', '<C-W>k', opts)

   -- window & tab controls
   map('n', '<leader>ss', ':sp<space>', opts)
   map('n', '<leader>vs', ':vsp<space>', opts)
   -- tab controls -- ctrl-t makes a new tab
   map('n', '<C-t>', '<Esc>:tabnew<CR>', opts) -- Check collision!
   -- shift T turn a split window into a tab
   map('n', '<S-T>', '<Esc><C-w>T', opts) -- Check collision!
   map('n', 'te', ':tabnext<CR>', opts)
   map('n', 'tn', ':tabprev<CR>', opts)
   map('n', 'th', ':tabfirst<CR>', opts)
   map('n', 'ti', ':tablast<CR>', opts)

-- }}}

-- {{{ Improvments
   map('n', '<leader><space>', ':set hlsearch!<CR>', opts)
   map('n', '<leader>sl', ':set wrap linebreak<CR>', opts)

   -- highlight last inserted text
   map('n', 'gV', '`[v]`', opts)

   -- turn on spell checker - ]s and [s to move, z= for suggestions
   map('n', '<leader>spl', ':set spell spelllang=en_us<CR>', opts)
   map('n', '<leader>nspl', ':set nospell<CR>', opts)
   map('n', '<leader>S', ':FixWhitespace<CR>', opts)

-- }}}





M.general = {
	v = {
		-- Move text
		["<M-k>"] = { "<ESC>:m .-2<CR>gv", "   Move text up" },
		["<M-j>"] = { "<ESC>:m .+1<CR>gv", "   Move text down" },

		-- Stay in visual line mode for < and >
		[">"] = { ">gv", "   Indent" },
		["<"] = { "<gv", "   Dedent" },

		-- Keep yanked text on paste
		--keymap("v", "p", '"_dP', opts)
		["p"] = { '"_dP', "   Paste" },
	},

	n = {
		["M-k"] = { ":m .-2<CR>", "   Move text up" },
		["M-j"] = { ":m .+1<CR>", "   Move text down" },
		["C-s"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>:w<CR>", "Format the file"},
		-- map("n", "<C-Up>", ":resize +2<CR>", opts)
		-- asdkeymap("n", "<C-Down>", ":resize -2<CR>", opts)
		-- asdkeymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
		-- asdkeymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
	},
	-- x = {
	-- Move text up and down
	-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
	-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
	-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
	-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
	-- },
}

M.dap = {
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "B   Toggle breakpoiunt" },
		["<leader>dc"] = { "<cmd> DapContinue <CR>", "C   Start or continue debugging" },
		["<leader>di"] = { "<cmd> DapStepInto <CR>", "I   Step Into" },
		["<leader>do"] = { "<cmd> DapStepOut <CR>", "O   Step Out" },
		["<leader>dv"] = { "<cmd> DapStepOver <CR>", "V   Step Over" },
		["<leader>dd"] = { "<cmd> DapTerminate <CR>", "D   Terminate Session" },
		["<leader>dr"] = { "<cmd> DapToggleRepl <CR>", "R   Toggle Repl" },
		["<leader>dk"] = { "<cmd> lua require('dap.ui.widgets').hover() <CR>", "K   Hover" },
	},
}

M.hop = {
	n = {

		["f"] = {
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
			"fdsa",
		},
		["F"] = {
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
			"fdsa",
		},
		["t"] = {
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
			"fdsa",
		},
		["T"] = {
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
			"fdsa",
		},
		["<leader>jw"] = { "<cmd> HopWordMW <CR>", "Hop to any word in any window." },
		["<leader>ja"] = { "<cmd> HopAnywhereMW <CR>", "Hop anywhere in any window." },
		["<leader>js"] = { "<cmd> HopPatternMW <CR>", "Hop to any string in any window." },
	},
}
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
M.rest = {
	n = {
		["rr"] = {
			"<Plug>RestNvim",
			"Rest client",
		},
	},
}

M.comment = {
  n = {
    ["gc"] = { "<Plug>Commentary", "Comment the current line"}
  }
}

M.chtsh = {
	n = {
		["<leader>cs"] = { ":Cheat<cr>", "Check cht.sh" },
	},
}

return M
