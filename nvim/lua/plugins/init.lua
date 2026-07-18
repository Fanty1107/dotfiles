return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "windwp/nvim-ts-autotag",
    -- Isso garante que ele só vai ser carregado nesses tipos de arquivo:
    ft = { "html", "javascriptreact", "typescriptreact", "xml", "vue", "svelte" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  
 {
  "IogaMaster/neocord",
  event = "VeryLazy",
  opts = {
    -- Configurações gerais
    logo                = "auto",
    logo_tooltip        = "Neovim",
    main_image          = "language",
    show_time           = true,
    global_timer        = false,
    
    -- Textos de exibição no Discord
    editing_text        = "Editing %s",
    file_explorer_text  = "Browsing",
    git_commit_text     = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text        = "Reading %s",
    workspace_text      = "Working on %s",
    line_number_text    = "Line %s out of %s",
    terminal_text       = "Using Terminal"
  }
}
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
