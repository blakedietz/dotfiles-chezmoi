-- taken from here: https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end

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
    opts = {
      defaults = {
        -- Support multi select of files from within search
        mappings = {
          i = {
            ["<CR>"] = select_one_or_multi,
          },
        },
        -- Make the file preview layout above the search
        -- result list
        layout_strategy = "vertical",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
      },
    },
  },
}
