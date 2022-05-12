local list = {}

list['codedark'] = [[
  try
      colorscheme codedark
  catch
  endtry
]]

local themes = {}

function themes.switchColorScheme(name)
    vim.cmd(list[name])
end

themes.switchColorScheme 'codedark'

return themes
