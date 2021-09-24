try

if g:smartim_disable == 1 || reg_recording() != '' || reg_executing() != ''
  echom 'disable smartim'
  finish
endif

let g:smartim_default = 'com.apple.keylayout.ABC'

catch
endtry
