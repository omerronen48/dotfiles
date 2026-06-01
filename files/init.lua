-- Install Lazy --
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS
require('lazy').setup({
  -- COLORS!!!!
  "morhetz/gruvbox",          -- Gruvbox
  "sainnhe/gruvbox-material", -- More Gruvbox
  'navarasu/onedark.nvim',    -- Onedark
  'doums/darcula',            -- Darcula
  "catppuccin/nvim",
  "olimorris/onedarkpro.nvim",
  "sainnhe/everforest",
  "yorik1984/newpaper.nvim",
  "marko-cerovac/material.nvim",
  "folke/tokyonight.nvim",
  'nvim-tree/nvim-web-devicons', -- Icons
  'tpope/vim-sleuth',            -- Detect tabstop and shiftwidth automatically
  'mfussenegger/nvim-dap',       -- Debugging
  "folke/flash.nvim",
  "mfussenegger/nvim-jdtls",
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  },

  -- Git related plugins
  {
    'tpope/vim-fugitive',
    branch = 'master',
    commit = "19ca61c78c86a2ce6a425aee9b1c6664e5149ea6"
  },
  'tpope/vim-rhubarb',

  -- UndoTree
  {
    "mbbill/undotree",
    branch = "master",
    comm = "56c684a805fe948936cda0d1b19505b84ad7e065"
  },

  -- Auto-pairs
  { "jiangmiao/auto-pairs" },

  -- Buferline
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    commit = "261a72b90d6db4ed8014f7bda976bcdc9dd7ce76"
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    branch = "main",
    commit = "41283fb402713fc8b327e60907f74e46166f4cfd"
  },

  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    branch = 'master',
    commit = "e37bb1feee9e7320c76050a55443fa843b4b6f83"
  },

  -- Multiple cursors
  {
    'mg979/vim-visual-multi',
    branch = "master",
    commit = "e2ff111f123da6cf97f95b96b10eb95854f953c9"
  },

  -- Treesitter context
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   branch = "master",
  --   commit = "7068ad6d16c682db0f6bf25f64ccfee34ec5d452"
  -- },

  -- Typescript support
  {
    'jose-elias-alvarez/typescript.nvim',
    branch = "main",
    commit = "de304087e6e49981fde01af8ccc5b21e8519306f"
  },

  -- Surround
  {
    'tpope/vim-surround',
    branch = "master",
    commit = "3d188ed2113431cf8dac77be61b842acb64433d9"
  },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    branch = "main",
    commit = "a7e39ae9e74f2c8c6dc4eea6d40c3971ae84752d"
  },

  -- Scrollbar
  {
    'petertriho/nvim-scrollbar',
    branch = "main",
    commit = "35f99d559041c7c0eff3a41f9093581ceea534e8"
  },

  -- Rainbow delimiters
  {
    'HiPhish/nvim-ts-rainbow2',
    branch = "master",
    commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f"
  },

  -- Indent blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    branch = "master",
    commit = "3d08501caef2329aba5121b753e903904088f7e6"
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    branch = "master",
    commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
    opts = {}
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    commit = "52f500110bcf9190b44b4d8640162adc86772ec4",
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Codium
  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({
  --     })
  --   end
  -- },

  -- Markdown
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({})
    end,
  },

  -- Terminal
  {
    'NvChad/nvterm',
    branch = 'main',
    commit = "3e43be1d0ca60cc5e2dfc2d289b06577e7e57e98",
    config = function()
      require("nvterm").setup()
    end,
  },
  -- {
  --   'akinsho/toggleterm.nvim',
  --   branch = 'main',
  --   commit = "137d06fb103952a0fb567882bb8527e2f92d327d",
  --   version = "*",
  --   config = true
  -- },

  -- Rust tools
  {
    'simrat39/rust-tools.nvim',
    branch = 'master',
    commit = "08665c68f3241bbcdcf0a3d6b34977d07f328283",
    config = function()
    end
  },
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^4', -- Recommended
  -- },

  -- Crates
  {
    'saecki/crates.nvim',
    branch = "main",
    commit = "d556c00d60c9421c913ee54ff690df2a34f6264e",
    tag = 'stable',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },

  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Spinny boiii
      {
        "j-hui/fidget.nvim",
        tag = "v1.1.0",
        opts = {},
      },

      -- Additional lua configuration
      'folke/neodev.nvim',
    },
  },

  -- NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    commit = "7aad1bf3f6b849cbf108e02c55ad4d701cb4d33a",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },

  -- Better UI for LSP
  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    commit = "a64225ca57a8f94d26f361ba8ee86e58c5ba27d1",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    branch = "main",
    commit = "24122371810089d390847d8ba66325c1f1aa64c0",
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Whichkey
  { 'folke/which-key.nvim', opts = {} },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    branch = "main",
    commit = "c02516144a4fbd777b6b060a068ab984ab5974d5",
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '--' },
        changedelete = { text = '__' },
      },
    },
  },

  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    branch = "master",
    commit = "0a5a66803c7407767b799067986b4dc3036e1983",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'linrongbin16/lsp-progress.nvim',
    }
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    branch = "main",
    commit = "9ef21b2e6bb6ebeaf349a0781745549bbb870d27",
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    dependencies = {
      { 'nvim-telescope/telescope-ui-select.nvim' },
    }
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    commit = "8012b55eee65eba1d1ee4df0a186d30e72dcbe65",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}, {})
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- [Keymaps] --
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Better window navigation
keymap("n", "<leader><Left>", "<C-w>h", opts)
keymap("n", "<leader><Down>", "<C-w>j", opts)
keymap("n", "<leader><Up>", "<C-w>k", opts)
keymap("n", "<leader><Right>", "<C-w>l", opts)
keymap("n", "<leader>o<Right>", "<C-w>s", opts)
keymap("n", "<leader>o<Left>", "<C-w>s", opts)
keymap("n", "<leader>o<Down>", "<C-w>v", opts)
keymap("n", "<leader>o<Up>", "<C-w>v", opts)

-- Undotree
keymap("", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Nerd tree
keymap("", "<leader>t", ":Neotree toggle<CR>", opts)

-- Telescope
keymap("", "<leader>f", ":Telescope find_files<cr>", opts)
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap("", "<leader>l", ":Telescope live_grep<cr>", opts)
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = '[/] Fuzzily search in current buffer' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- LSP
keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<leader>n", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "<leader>p", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<leader>re", "<cmd>Lspsaga rename<cr>", opts)
-- keymap("n", "<leader>r", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts) -- refs w/ grep view
-- keymap("n", "<leader>hh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
-- keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
-- keymap("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
-- keymap("n", "<leader>re", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Bufferline
keymap("", "<leader>c", "<cmd>BufferLinePickClose<CR>", opts)
keymap("", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Search and replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- End of line
keymap('n', '00', '$', opts)

-- Git
keymap("n", "<leader>g", "<cmd>Git<CR>", opts)
keymap("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>gd", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Git blame<CR>", opts)
keymap("n", "<leader>gl", "<cmd>Git log<CR>", opts)
keymap("n", "<leader>gr", "<cmd>Gvdiffsplit!<CR>", opts)
keymap("n", "<leader>gg", "<cmd>lua toggle_git_signs()<CR>", opts)

-- Pre-commit hook for Python repos (git fugitive)
-- Function to run pre-commit before opening commit editor
function _G.run_precommit_and_commit()
  -- Check if this is a Python repo by looking for .py files
  local has_python = vim.fn.glob("**/*.py", false, true)
  if #has_python == 0 then
    -- Not a Python repo, proceed with commit
    vim.cmd("Git commit")
    return
  end

  -- Run newt pre-commit
  print("Running pre-commit checks...")
  local result = vim.fn.system("newt pre-commit run")
  local exit_code = vim.v.shell_error

  if exit_code ~= 0 then
    -- Pre-commit failed, show output and abort
    vim.api.nvim_err_writeln("Pre-commit hook failed! Aborting commit.")

    -- Show the output in a split
    vim.cmd("new")
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result, "\n"))
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].filetype = "text"
    vim.api.nvim_buf_set_name(buf, "Pre-commit Output")
  else
    -- Pre-commit passed, proceed with commit
    print("Pre-commit checks passed!")
    vim.cmd("Git commit")
  end
end

-- Override 'cc' in fugitive buffers to run pre-commit first
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function(args)
    vim.keymap.set('n', 'cc', '<cmd>lua run_precommit_and_commit()<CR>', { buffer = args.buf, silent = true })
  end,
})

-- Terminal
keymap("n", "<leader><space>", "<cmd>lua require('nvterm.terminal').toggle 'vertical'<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Rust
keymap("n", "<leader>z", "<cmd>lua pick_and_run_rust_test()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>zz', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
-- keymap("n", "<leader>z", "<cmd>lua require('rust-tools').runnables.runnables()<CR>", opts)

-- Debugging
keymap("n", "<leader>xb", "<cmd>DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>xi", "<cmd>DapStepInto<cr>", opts)
keymap("n", "<leader>xo", "<cmd>DapStepOver<CR>", opts)
keymap("n", "<leader>xr", "<cmd>RustDebuggables<CR>", opts)
vim.keymap.set("n", "<leader>xs", function()
  local w = require('dap.ui.widgets');
  local s = w.sidebar(w.scopes);
  s.open();
end, { desc = "Show debugger" })
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- [Settings] --
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 4                         -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.backspace = "indent,eol,start"
vim.opt.undodir = "~/.config/nvim/undodir"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.o.mouse = 'a'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
-- vim.cmd.colorscheme 'gruvbox-material'
vim.cmd('colorscheme gruvbox-material')
vim.schedule(function()
  -- Inline diagnostics virtual text color and underline
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934", bg = "#3c3836", bold = true }) -- Red for errors
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f", bg = "#3c3836", bold = true })  -- Yellow for warnings
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#83a598", bg = "#3c3836", bold = true })  -- Blue for info
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#8ec07c", bg = "#3c3836", bold = true })  -- Green for hints

  -- Underline diagnostics in code
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#fb4934", undercurl = true }) -- Red undercurl for errors
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "#fabd2f", undercurl = true })  -- Yellow undercurl for warnings
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "#83a598", undercurl = true })  -- Blue undercurl for info
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "#8ec07c", undercurl = true })  -- Green undercurl for hints
  vim.g.gruvbox_material_diagnostic_text_highlight = false
  vim.g.gruvbox_material_diagnostic_line_highlight = false
  vim.g.gruvbox_material_diagnostic_virtual_text = false
end)
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "dist/",
      "build/",
    },
  },
  pickers = {
    current_buffer_fuzzy_find = {
      theme = "dropdown",
      previewer = false,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'java', 'lua', 'rust', 'markdown_inline', 'markdown', 'vim', 'python', 'typescript', 'javascript', 'yaml', 'toml', 'css', 'html' },
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
}
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- [[LSP settings]] --
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Format on save (excluding Python files)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("omes", { clear = true }),
--   callback = function()
--     -- Skip auto-formatting for Python files
--     if vim.bo.filetype ~= "python" then
--       vim.lsp.buf.format()
--     end
--   end
-- })
--
-- Enable the following language servers
local servers = {
  -- lua_ls = {
  --   Lua = {
  --     workspace = { checkThirdParty = false },
  --     telemetry = { enable = false },
  --   },
  -- },
}
--------------------------------------------------------------------------------------------
-- Setup neovim lua configuration
require('neodev').setup()
--------------------------------------------------------------------------------------------
-- [Mason] --
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- [Completions] --
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "codeium" }
  },
}
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Bufferline & Lualine --
require("bufferline").setup {}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = 'gruvbox-material',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', {
      'diff',
      symbols = {
        added = '⊕',
        modified = '≈',
        removed = '⊖',
      },
    } },
    lualine_c = { {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = '🆇  ', warn = ' ', info = ' ', hint = ' ' },
    } },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}

--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Alpha --
local dashboard = require("alpha.themes.dashboard")
require("alpha.themes.dashboard").section.header.val = {
  [[  ****     ** ********   *******   **      ** ** ****     **** ]],
  [[ /**/**   /**/**/////   **/////** /**     /**/**/**/**   **/** ]],
  [[ /**//**  /**/**       **     //**/**     /**/**/**//** ** /** ]],
  [[ /** //** /**/******* /**      /**//**    ** /**/** //***  /** ]],
  [[ /**  //**/**/**////  /**      /** //**  **  /**/**  //*   /** ]],
  [[ /**   //****/**      //**     **   //****   /**/**   /    /** ]],
  [[ /**    //***/******** //*******     //**    /**/**        /** ]],
  [[ //      /// ////////   ///////       //     // //         //  ]],
}
require("alpha.themes.dashboard").section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  return "Hello, Omer!"
end

require("alpha.themes.dashboard").section.footer.val = footer()
require("alpha.themes.dashboard").section.footer.opts.hl = "Type"
require("alpha.themes.dashboard").section.header.opts.hl = "Include"
require("alpha.themes.dashboard").section.buttons.opts.hl = "Keyword"

require("alpha.themes.dashboard").opts.opts.noautocmd = true
require("alpha").setup(require("alpha.themes.dashboard").opts)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Gitsigns toggle
function _G.toggle_git_signs()
  vim.cmd("Gitsigns toggle_deleted")
  vim.cmd("Gitsigns toggle_word_diff")
  vim.cmd("Gitsigns toggle_linehl")
end

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Others: Fidget, Gitsigns, Neotree, Scrollbar & TODO --
require("fidget").setup {
  progress = {
    display = {
      progress_icon = {
        pattern = "meter",
      }
    }
  }
}
require("scrollbar").setup()
require("todo-comments").setup {}
require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  icon = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "󰜌",
    default = "*",
    highlight = "NeoTreeFileIcon"
  },
  modified = {
    symbol = "[+]",
    highlight = "NeoTreeModified",
  },
  name = {
    trailing_slash = false,
    use_git_status_colors = true,
    highlight = "NeoTreeFileName",
  },
})
require('gitsigns').setup {
  current_line_blame = true, -- Always show current line blame
  numhl = true,              -- Highlight line number
}
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Rust tools & Typescript support && terminal
-- require("rust-tools").setup {}
-- require("typescript").setup {}
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- Rust test helper
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

function _G.pick_and_run_rust_test()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = { textDocument = vim.lsp.util.make_text_document_params() }

  vim.lsp.buf_request(bufnr, 'textDocument/documentSymbol', params, function(err, result, ctx, config)
    if err then
      vim.notify("Error fetching document symbols: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result or vim.tbl_isempty(result) then
      vim.notify("No symbols found in document", vim.log.levels.INFO)
      return
    end

    -- Filter results for tests (e.g., functions annotated with #[test])
    local tests = {}
    for _, symbol in ipairs(result) do
      if symbol.kind == 12 and string.match(symbol.name, "test") then -- kind 12 usually stands for Function in LSP
        table.insert(tests, symbol)
      end
    end

    if #tests == 0 then
      vim.notify("No test functions found", vim.log.levels.INFO)
      return
    end

    -- Using Telescope to display the test functions
    pickers.new({}, {
      prompt_title = "Rust Tests",
      finder = finders.new_table({
        results = tests,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name,
            ordinal = entry.name,
          }
        end
      }),

      sorter = sorters.get_generic_fuzzy_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        local function run_selected()
          local selection = action_state.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          local test_name = selection.value.name
          local cmd = "cargo test " .. test_name
          vim.cmd("new | terminal " .. cmd)
          print("Running test: ", test_name)
        end

        map('i', '<CR>', run_selected)
        map('n', '<CR>', run_selected)

        return true
      end
    }):find()
  end)
end

