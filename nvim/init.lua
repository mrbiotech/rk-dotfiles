package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader=" "

local vim = vim
local o = vim.opt

require("config.lazy")

o.compatible = false
o.termguicolors = true
o.backspace = indent,eol,start
o.background = dark
vim.cmd("set splitbelow")
vim.cmd("set splitright")
o.encoding="utf-8"
-- material-oceanic, habamax, material-darker, material-lighter,
vim.cmd("colorscheme nordfox")
--vim.cmd("set guifont=ZedMono NFP:h12")
vim.cmd("set hlsearch")
vim.cmd("set showmode")
vim.cmd("set number")
vim.cmd("set showmatch")
vim.cmd("set showcmd")
vim.cmd("set ruler")
vim.cmd("set laststatus=3")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

vim.cmd("au BufRead,BufNewFile *.noml set filetype=noml")
vim.cmd("au BufRead,BufNewFile *.njk set filetype=html")
vim.cmd("au BufRead,BufNewFile *.njk set syntax=html")
vim.cmd("au BufRead,BufNewFile *.liquid set filetype=html")
vim.cmd("au BufRead,BufNewFile *.liquid set syntax=html")
vim.cmd("au BufRead,BufNewFile *.hbs set filetype=html")
vim.cmd("au BufRead,BufNewFile *.hbs set syntax=html")
vim.cmd("au BufRead,BufNewFile *.mustache set filetype=html")
vim.cmd("au BufRead,BufNewFile *.mustache set syntax=html")

-- nvim-tree setup
require("nvim-tree").setup({
    sort = { sorter = "case_sensitive", },
    view = { width = 35, },
    renderer = { group_empty = true, },
    filters = {
        dotfiles = false,
        custom = {
            "^.git$",
        },
    },
})

local helpers = require 'incline.helpers'
local devicons = require 'nvim-web-devicons'
require('incline').setup {
    window = {
        padding = 0,
        margin = { vertical = 1 },
    },
    hide = {
        cursorline = true,
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        if filename == '' then
            filename = '[No Name]'
        end
        return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#555555',
            guifg = '#dddddd',
        }
    end
}
-- Ctrl+N to open NVim Tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

