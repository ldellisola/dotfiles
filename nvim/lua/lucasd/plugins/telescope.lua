local t_setup, t = pcall(require,"telescope")
if not t_setup then
  return
end

local a_setup, a = pcall(require,"telescope.actions")
if not a_setup then
  return
end

-- configure telescope
t.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = a.move_selection_previous, -- move to prev result
        ["<C-j>"] = a.move_selection_next, -- move to next result
        ["<C-q>"] = a.send_selected_to_qflist + a.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

t.load_extension("fzf")
