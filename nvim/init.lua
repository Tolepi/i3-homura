vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
          return {
            Normal = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { fg = "#ff2a85", bg = "NONE" },
            LineNr = { fg = "#444444" },
            CursorLineNr = { fg = "#ff2a85", bold = true },
            CursorLine = { bg = "NONE" },
            StatusLine = { fg = "#ffffff", bg = "#000000" },
            Search = { fg = "#000000", bg = "#ff2a85" },
            IncSearch = { fg = "#000000", bg = "#ff2a85" },
            Visual = { bg = "#333333" },
            Keyword = { fg = "#ff2a85", bold = true },
            Statement = { fg = "#ff2a85" },
            Function = { fg = "#ffffff", bold = true },
            String = { fg = "#888888" },
            Comment = { fg = "#555555", italic = true },
            TelescopeBorder = { fg = "#ff2a85", bg = "NONE" },
            TelescopePromptBorder = { fg = "#ff2a85", bg = "NONE" },
            TelescopeResultsBorder = { fg = "#ff2a85", bg = "NONE" },
            TelescopePreviewBorder = { fg = "#ff2a85", bg = "NONE" },
            TelescopePromptPrefix = { fg = "#ff2a85" },
            TelescopeSelection = { fg = "#000000", bg = "#ff2a85" },
            GitSignsAdd = { fg = "#ff2a85" },
            GitSignsChange = { fg = "#888888" },
            GitSignsDelete = { fg = "#444444" },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  { "nvim-tree/nvim-web-devicons" },

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorador" },
    },
    opts = {
      view = { width = 28 },
      renderer = {
        icons = {
          show = { file = true, folder = true, folder_arrow = false },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local custom_theme = {
        normal = {
          a = { fg = "#000000", bg = "#ff2a85", gui = "bold" },
          b = { fg = "#ffffff", bg = "#000000" },
          c = { fg = "#888888", bg = "NONE" },
        },
        insert = { a = { fg = "#000000", bg = "#ffffff", gui = "bold" } },
        visual = { a = { fg = "#000000", bg = "#888888", gui = "bold" } },
        replace = { a = { fg = "#000000", bg = "#ff2a85", gui = "bold" } },
        inactive = {
          a = { fg = "#444444", bg = "#000000" },
          b = { fg = "#444444", bg = "#000000" },
          c = { fg = "#444444", bg = "NONE" },
        },
      }

      require("lualine").setup({
        options = {
          theme = custom_theme,
          component_separators = "",
          section_separators = "",
          icons_enabled = true,
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    },
    opts = {
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
  },
})

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
