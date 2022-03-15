local list = {}

list['codedark'] = [[
  colorscheme codedark
]]

local themes = {}

function themes.switchColorScheme(name)
    vim.cmd(list[name])
end

return themes
