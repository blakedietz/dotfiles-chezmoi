local function remove_from_list(list, element)
  for i, v in ipairs(list) do
    if v == element then
      table.remove(list, i)
      return
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { "markdown" },
          init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              heex = "phoenix-heex",
            },
          },
          settings = {
            includeLanguages = {
              ["html-eex"] = "html",
              ["phoenix-heex"] = "html",
              heex = "html",
              eelixir = "html",
              elixir = "html",
            },
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    init = function()
      -- Not actually running anything that modifies the snippet options, primarily just trying to configure
      -- snippets to be loaded
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "/Users/blakedietz/projects/blakedietz/vscode-snippets-liveview/build/neovim" },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Remove elixirls from configurations introduced by in lazy.lua
      -- { import = "lazyvim.plugins.extras.lang.elixir" },
      remove_from_list(opts.ensure_installed, "elixir-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Remove elixirls from configurations introduced by in lazy.lua
      -- { import = "lazyvim.plugins.extras.lang.elixir" },
      opts.servers.elixirls = nil
      return opts
    end,
  },
}
