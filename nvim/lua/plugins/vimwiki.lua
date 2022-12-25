return {
  "vimwiki/vimwiki",
  config = function()
    vim.g.vimwiki_list = { { path = '~/Dropbox/notes', syntax = 'markdown', ext = '.md' } }
    vim.g.vimwiki_global_ext = 0
  end,
}
