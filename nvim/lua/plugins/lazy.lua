return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            -- scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            notifier = { enabled = true },
        },
    },
    {
        "equalsraf/neovim-gui-shim",
        lazy = false,
    },
    {
        "mattn/emmet-vim",
        lazy = false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd([[colorscheme tokyonight]]),
    --     end,
    -- },
    -- {
    --     "nvim-neorg/neorg",
    --     lazy = false,
    --     version = "*",
    --     config = true,
    -- },
    {
        "rktjmp/playtime.nvim",
        lazy = false,
        config = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", },
        lazy = false,
        version = "*",
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'wombat',
                    icons_enabled = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
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
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },
    -- {
    --     "beauwilliams/statusline.lua",
    --     lazy = false,
    --     config = false,
    -- },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        lazy = false,
        config = false,
    },
    {
        "b0o/incline.nvim",
        config = function()
            require('incline').setup()
        end,
    },
    {
        "marko-cerovac/material.nvim",
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = true,
            css_fun = true,
            sass = {
                enable = true,
                parsers = { "css" },
            },
        },
    },
}
