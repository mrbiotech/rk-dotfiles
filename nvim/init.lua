package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader=" "
vim.g.maplocalleader=","
vim.g.markdown_folding = 1
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"

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
-- miasma, material-oceanic, habamax, material-darker, material-lighter, nordfox, retrobox, terabox, unokai, zephyr
vim.cmd("colorscheme retrobox")
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

-- For Treesitter-based folding:
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'py' },
    callback = function() vim.treesitter.start() end,
})

-- Ctrl+N to open NVim Tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Temporary macros for make figlet fonts Powerline compatible.
-- vim.cmd('let @a = "r<C-v>ue0ba<Esc><Right>"')
-- vim.cmd('let @s = "r<C-v>ue0bc<Esc><Right>"')
-- vim.cmd('let @d = "r<C-v>ue0b8<Esc><Right>"')
-- vim.cmd('let @f = "r<C-v>ue0be<Esc><Right>"')
-- vim.cmd('let @g = "r<C-v>u2588<Esc><Right>"')
-- vim.cmd('let @h = "r<C-v>u2587<Esc><Right>"')
-- vim.cmd('let @j = "r<C-v>u2580<Esc><Right>"')
-- vim.cmd('let @k = "r<C-v>ue0b6<Esc><Right>"')
-- vim.cmd('let @l = "r<C-v>ue0b4<Esc><Right>"')

-- Attempting to do the same the official Lua way:
local predef_registers = {
    a = "rue0bal",
    s = "rue0bcl",
    d = "rue0b8l",
    f = "rue0bel",
    g = "ru2588l",
    h = "ru2586l",
    j = "ru2580l",
    k = "rue0b6l",
    l = "rue0b4l",
}
-- Vim autocommand to populate the registers on Nvim start:
vim.api.nvim_create_autocmd("VimEnter",{
    callback = function()
        for reg_name, text in pairs(predef_registers) do
            vim.fn.setreg(reg_name, text, 'c')
        end
    end,
})
