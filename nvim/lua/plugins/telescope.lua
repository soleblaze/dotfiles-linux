return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    { "nvim-lua/plenary.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("repo")

    vim.cmd("command! -bang Keymap Telescope keymaps")
  end,
}
