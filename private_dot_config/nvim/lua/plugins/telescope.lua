-- taken from here: https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    init = function() end,
    opts = {
      defaults = {
        -- Make the file preview layout above the search
        -- result list
        layout_strategy = "vertical",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
      },
    },
  },
}
