return {
    {
        'folke/snacks.nvim',
        lazy = false,
        priority = 1000,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dim = { enabled = true},
            dashboard = {
                ---@class snacks.dashboard.Config
                ---@field enabled? boolean
                ---@field sections snacks.dashboard.Section
                ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
                width = 50,
                autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
                -- These settings are used by some built-in sections
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your custom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = " ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    -- Used by the `header` section
                    header = [[
    ██ ████████████████████████
   ███ ████___████████████████
  ██████████ ██ ██ ██████████████ ⁝
 ████████ ██ ██ █████████ ███ ⁝
██ ████████████████  ██████ _███⁝
_________________  _____   ____]],
                  },
                  -- item field formatters
                  formats = {
                    icon = function(item)
                      if item.file and item.icon == "file" or item.icon == "directory" then
                        return Snacks.dashboard.icon(item.file, item.icon)
                      end
                      return { item.icon, width = 2, hl = "icon" }
                    end,
                    footer = { "%s", align = "center" },
                    header = { "%s", align = "center" },
                    file = function(item, ctx)
                      local fname = vim.fn.fnamemodify(item.file, ":~")
                      fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                      if #fname > ctx.width then
                        local dir = vim.fn.fnamemodify(fname, ":h")
                        local file = vim.fn.fnamemodify(fname, ":t")
                        if dir and file then
                          file = file:sub(-(ctx.width - #dir - 2))
                          fname = dir .. "/…" .. file
                        end
                      end
                      local dir, file = fname:match("^(.*)/(.+)$")
                      return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
                    end,
                },
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "chafa ~/rk-dotfiles/walls/bg_1.jpg --format symbols --symbols vhalf --size 50x12 --stretch; sleep .1",
                        height = 12,
                        padding = 1,
                    },
                    { section = "keys", gap = 0, padding = 1 },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 1,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 50,
                        indent = 3,
                    },
                    { section = "startup" },
                },
            },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            -- scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
    {
        'equalsraf/neovim-gui-shim',
        lazy = false,
    },
    {
        'mattn/emmet-vim',
        lazy = false,
    },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup {}
        end,
    },
    -- Experimenting with colorschemes:
    { 'EdenEast/nightfox.nvim' },
    { 'nvimdev/zephyr-nvim'},
    { 'rebelot/kanagawa.nvim' },
    { 'thesimonho/kanagawa-paper.nvim' },
    { 'dasupradyumna/midnight.nvim' },
    { 'zootedb0t/citruszest.nvim' },
    { 'FrenzyExists/aquarium-vim' },

    { 'bakageddy/alduin.nvim' },
    { 'xero/miasma.nvim' },
    { 'savq/melange-nvim' },
    { 'rktjmp/lush.nvim' },
    {
        'ray-x/starry.nvim',
        config = function()
            require('starry').setup ({
            border = true,
            hide_eob = false,
            italics = {
                comments = true,
                strings = true,
                keywords = false,
                functions = false,
                variables = false,
            },
            contrast = {
                enable = false,
                terminal = true,
                filetypes = {},
            },
            text_contrast = {
                lighter = true,
                darker = false
            },
            disable = {
                background = false,
                term_colors = false,
                eob_lines = true
            },
            style = {
                name = 'moonlight', -- Themes: dracula, dracula_blood, deepocean, darker, earlysummer, earlysummer_lighter, palenight, monokai, mariana, emerald, middlenight_blue
                disable = {},
                fix = true,
                darker_contrast = false,
                daylight_switch = true,
                deep_black = false,
            },
            custom_colors = {
            },
            custom_highlights = {
            }
        })
        end
    },
    { 'ray-x/aurora' },
    -- END Experimenting with colorschemes.
    {
        'rktjmp/playtime.nvim',
        lazy = false,
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        lazy = false,
        version = '*',
        config = function()
            require('lualine').setup {
                options = {
                    -- wombat, material, onelight, onedark, powerline, solarized_dark, 
                    theme = 'wombat',
                    icons_enabled = true,
                    always_show_tabline = false,
                    globalstatus = false,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch','diff','diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding','fileformat','filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'},
                },
                inactive_sections = {},
                tabline = {
                    lualine_a = {'buffers'},
                    lualine_b = {'branch'},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },
    -- {
    --     'beauwilliams/statusline.lua',
    --     lazy = false,
    --     config = false,
    -- },
    {
        'SmiteshP/nvim-navic',
        dependencies = { 'neovim/nvim-lspconfig' },
        lazy = false,
        config = false,
    },
    {
        'b0o/incline.nvim',
        config = function()
            require('incline').setup()
        end,
    },
    {
        'marko-cerovac/material.nvim',
    },
    {
        'catgoose/nvim-colorizer.lua',
        event = 'BufReadPre',
        opts = {
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = true,
            css_fun = true,
            sass = {
                enable = true,
                parsers = { 'css' },
            },
        },
    },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {},
        config = function()
            require('noice').setup({
                lsp = {
                    override = {
                        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                        ['vim.lsp.util.stylize_markdown'] = true,
                        ['cmp.entry.get_documentation'] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = true,
                },
            })
        end
    },
    {
        'eandrju/cellular-automaton.nvim',
        config = function()
            vim.keymap.set('n', '<leader>fmr', '<cmd>CellularAutomaton make_it_rain<CR>')
            vim.keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton game_of_life<CR>')
        end
    },
    {
        'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require('duck').hatch() end, {})
            vim.keymap.set('n', '<leader>ds', function() require('duck').hatch('😁',10) end, {})
            vim.keymap.set('n', '<leader>di', function() require('duck').hatch('👾',10) end, {})
            vim.keymap.set('n', '<leader>dt', function() require('duck').hatch('🦖',10) end, {})
            vim.keymap.set('n', '<leader>dc', function() require('duck').hatch('🦀',10) end, {})
            vim.keymap.set('n', '<leader>dj', function() require('duck').hatch('🪼',10) end, {})
            vim.keymap.set('n', '<leader>db', function() require('duck').hatch('🕷️',10) end, {})
            vim.keymap.set('n', '<leader>df', function() require('duck').hatch('🪰',10) end, {})
            vim.keymap.set('n', '<leader>dk', function() require('duck').cook() end, {})
            vim.keymap.set('n', '<leader>da', function() require('duck').cook_all() end, {})
        end
    },
    -- {'AndrewRadev/typewriter.vim'},
    {
        'jim-fx/sudoku.nvim',
        cmd = 'Sudoku',
        config = function()
            require('sudoku').setup({
                persist_settings = true,
                persist_games = true,
                default_mappings = true,
            })
        end
    },
    {
        'seandewar/actually-doom.nvim',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup ({
                ensure_installed = {
                    'lua',
                    'vim',
                    'vimdoc',
                    'query',
                    'markdown',
                    'markdown_inline',
                    'apex',
                    'css',
                    'csv',
                    'dockerfile',
                    'Godot',
                    'go',
                    'html',
                    'htmldjango',
                    'jinja',
                    'jinja_inline',
                    'jq',
                    'json',
                    'jsdoc',
                    'JSON with comments',
                    'liquid',
                    'mermaid',
                    'nix',
                    'python',
                    'r',
                    'regex',
                    'rust',
                    'soql',
                    'sql',
                    'toml',
                    'tsv',
                    'twig',
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true, -- If getting duplicate highlights, change to false.
                },
                indent = { enable = true },
            })
        end
    },
}
