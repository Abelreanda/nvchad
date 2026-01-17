return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            filters = {
                custom = { "^\\.git$" },
                git_ignored = false,
                dotfiles = false,
            },
            renderer = {
                -- root_folder_label = ":t",
                icons = {
                    glyphs = {
                        default = "  ",
                        symlink = "",
                        folder = {
                            arrow_closed = "", -- Icono cuando la carpeta está cerrada
                            arrow_open = "",   -- Icono cuando la carpeta está abierta
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                        },
                        git = {
                            unstaged = "󱔀",
                            staged = "",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "",
                            deleted = "",
                            ignored = "",
                        },
                    },
                }
            }
        }
    },

    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                -- Lista de carpetas o archivos que Telescope NUNCA debe mostrar
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "target/",
                    "dist/",
                    "build/",
                },
            },
            pickers = {
                find_files = {
                    -- Permite buscar archivos que empiezan con un punto (ej. .env, .prettierrc)
                    hidden = true,
                    -- Opcional: si quieres que ignore lo definido en tu .gitignore, déjalo en false
                    -- Si quieres ver TODO a pesar del .gitignore, cámbialo a true
                    -- no_ignore = false,
                },
            },
        },
    },

    {
        "github/copilot.vim",
        lazy = false,
        config = function() -- Mapping tab is already used in NvChad
            vim.g.copilot_no_tab_map = true; -- Disable tab mapping
            vim.g.copilot_assume_mapped = true; -- Assume that the mapping is already done
        end
    },

    {
        "hrsh7th/nvim-cmp",
        -- Usamos 'opts' para modificar la configuración base sin romperla
        opts = function(_, opts)
            local cmp = require("cmp")

            -- 1. Desactivar en ciertos filetypes
            cmp.setup.filetype({ "blade", "pug" }, {
                enabled = false
            })

            -- 2. Modificar solo los mapeos necesarios
            -- Usamos vim.tbl_extend para no perder los mapeos de navegación (Tab, C-n, etc.)
            opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
                -- Ctrl + Enter para confirmar
                ["<C-CR>"] = cmp.mapping.confirm({ select = true }),

                -- Deshabilitar Enter para que actúe como un salto de línea normal
                -- Usar cmp.config.disable es más limpio que abort() para dejar pasar la tecla
                ["<CR>"] = cmp.config.disable,
            })
        end,
    },

    -- {
    --     "hrsh7th/nvim-cmp",
    --     opts = function(_, opts)
    --         -- Crear una función para desactivar cmp en ciertos archivos
    --         local cmp = require("cmp")
    --         cmp.setup.filetype({ "blade", "pug" }, {
    --             enabled = false
    --         })
    --     end,
    --     config = function()
    --         -- Hacer que autocompletado no se acepte con enter sino con ctrl+enter
    --         local cmp = require("cmp")
    --         cmp.setup({
    --             mapping = {
    --                 ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    --                 ['<CR>'] = cmp.mapping.abort(),
    --             }
    --         })
    --     end,
    -- },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    {
    	"nvim-treesitter/nvim-treesitter",
    	opts = {
    		ensure_installed = {
    			"vim", "lua", "vimdoc", "css", "blade", "pug",
    		},
    	},
    },
}

