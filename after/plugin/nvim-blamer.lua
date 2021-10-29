local status, nvimBlamer = pcall(require, 'nvim-blamer')
if not status then
    return
end

nvimBlamer.setup {
    enable = true, -- you must set this to true in order to show the blame info
    prefix = '   ', -- you can cusomize it to any thing, unicode emoji, even disable it, just set to empty lua string
    format = '🙋%committer ⏰ %committer-time-human • %summary',
    auto_hide = false, -- set this to true will enable delay hide even you do not have the cursor moved
    hide_delay = 3000, -- this is the delay time in milliseconds for delay auto hide
    show_error = false, -- set to true to show any possible error (just for debug problems)
}

vim.call 'nvimblamer#auto'
