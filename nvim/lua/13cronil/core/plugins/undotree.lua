return {
  "jiaoshijie/undotree",
  opts = {
    float_diff = true,
    layout = "left_bottom",
    position = "left",
    window = {
      width = 0.25,
      height = 0.25,
      border = "rounded",
    },
    ignore_filetype = {},
    parser = "compact",
    keymaps = {
      ["j"] = "move_next",
      ["k"] = "move_prev",
      ["gj"] = "move2parent",
      ["J"] = "move_change_next",
      ["K"] = "move_change_prev",
      ["<cr>"] = "action_enter",
      ["p"] = "enter_diffbuf",
      ["q"] = "quit",
      ["S"] = "update_undotree_view",
    },
  },
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
