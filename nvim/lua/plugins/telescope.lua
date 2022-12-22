return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    "cljoly/telescope-repo.nvim",
    "nvim-telescope/telescope-dap.nvim"
  }
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("repo")

    vim.cmd("command! -bang Keymap Telescope keymaps")
  end,
}
