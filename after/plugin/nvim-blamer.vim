try
  call nvimblamer#auto()

""" config the plugin
lua <<EOF

require'nvim-blamer'.setup({
    enable = false,
    format = '%committer │ %committer-time-human │ %summary',
})

EOF

catch
endtry
