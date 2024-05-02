

--[[

 ______   __   ______   ______    
/\  ___\ /\ \ /\  ___\ /\  ___\   
\ \ \____\ \ \\ \  __\ \ \___  \  
 \ \_____\\ \_\\ \_____\\/\_____\ 
  \/_____/ \/_/ \/_____/ \/_____/ 

  --]]
--- Bootstraping Lazy Package Manager ---

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--- ### Plugins Setup ### ---

  --- Neoconf ---
require("lazy").setup({
  { "folke/neoconf.nvim", cmd = "Neoconf" , lazy = true },
  "folke/neodev.nvim",

	-- copilot --
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "no", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'yes', -- Disable extra information (e.g: system prompt) in the response.
      language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      }
    },
  },
  --- ColorScheme ---

  { 
		"EdenEast/nightfox.nvim",

	},
	{
		"dracula/vim",
	},

-- TODO --

-- Use tab for trigger completion with characters ahead and navigate.
-- Use command ':help completion-nvim-tab-complete' for more information
-- HELP!
  -- Mason ---
{
    "williamboman/mason.nvim"
},
  --- Mason Lsp ---

  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
      require("mason-lspconfig").setup(lvim.lsp.installer.setup)

      -- automatic_installation is handled by lsp-manager
      local settings = require "mason-lspconfig.settings"
      settings.current.automatic_installation = true
    end,
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim",
  },

  --- Telescope ---

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
    end,
    dependencies = { "telescope-fzf-native.nvim" },
    lazy = true,
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
{
    'nvim-lua/plenary.nvim'
  },
  --- Treesitter ---  
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "lua", -- Install all languages
        auto_install = true,
        highlight = { enable = true },
      }
      vim.filetype.add {
        pattern = {
          ['.*/hypr/.*%.conf'] = 'hyprlang',
        },
      }
    end,
  },
-- Project ---
{
  "ahmedkhalf/project.nvim",
    lazy = true,
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  end
},
  -- Icons
{
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  --- Transparency ---
{ "xiyaowong/transparent.nvim",
  lazy = false,
},
  --- Dashboard ---
{
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
},

  --- Markdown Preview ---
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
},

  --- Lualine ---
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' , opt = true }
},

  --- nvim-tree ---
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("nvim-tree").setup {}
  end
},

  --- Autopair ---
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
},
{
  'hrsh7th/nvim-compe',
  event = 'InsertEnter',
  config = function()
    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = true;

      source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
        snippets_nvim = true;
        treesitter = true;
      };
    }
    -- Use tab for trigger completion with characters ahead and navigate.
    vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
    vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
  end
},
  --- Bufferline ---
{
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
},

{
	"connorholyday/vim-snazzy",
		config = function()
			vim.cmd('colorscheme snazzy')
		end
},
  })
