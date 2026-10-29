-- ~/.config/nvim-new/lua/plugins.lua
-- gitsigns.nvim
vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup({ signcolumn = false })

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.pack.add{
    {src = 'https://github.com/ManuLinares/nvim-c3.git'},
}
require("c3").setup({
      lsp = {
    enable = true, -- Set to false to disable LSP
    cmd = "c3_ls", -- We use https://github.com/ManuLinares/c3_ls but you can use whatever you want
    version = "latest", -- (1)
    compiler_path = nil, -- Custom path to c3c binary (2)
    stdlib_path = nil, -- Custom path to C3 standard library (2)
    format_on_save = false, -- Format buffer on save using LSP
    log_level = nil, -- (3) "error" | "warn" | "info" | "debug" (default: "error")
    log_path = nil, -- Custom path to log file
  },
  highlighting = {
    enable_treesitter = true,
  }
})

--mason.nvim
vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({})


--blink.cmp
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-p>"] = {},
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-n>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
        ["<C-e>"] = { "hide" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})

-- Color Scheme
vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})
require("rose-pine").setup()
vim.cmd("colorscheme rose-pine")


--fuzzy picker
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})
-- git interaction with vim-fugitive
vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
})

--harpoon
vim.pack.add({
    { src = "https://github.com/vieitesss/miniharp.nvim" },
})

require('miniharp').setup({ show_on_autoload = true })
-- transparent effect
vim.pack.add({
    {src = "https://github.com/tribela/transparent.nvim.git"}
})
require('transparent').setup({auto = true})

-- treesitter for better syntax highlight
vim.pack.add({
    {src = "https://github.com/nvim-treesitter/nvim-treesitter.git"}
})
require('nvim-treesitter').setup{
    install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'c', 'zig', 'cpp', 'go', 'python' }
-- file explorer
vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})
-- Cord
vim.pack.add({
    'https://github.com/vyfor/cord.nvim'
})
require('cord').setup{}
--StatusBar
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {"os.date('%H:%M')", 'data', "require'lsp-status'.status()"},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
--focus
vim.pack.add({
    {src ="https://github.com/nvim-focus/focus.nvim.git"},
})
require("focus").setup({
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        focusedwindow_minwidth = 0, --Force minimum width for the focused window
        focusedwindow_minheight = 0, --Force minimum height for the focused window
        height_quickfix = 10, -- Set the height of quickfix panel
        equalise_min_cols = 0, -- Use equal splits when columns >= this value (0 = ignore)
        equalise_min_rows = 0, -- Use equal splits when rows >= this value (0 = ignore)
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = true, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    }
})



