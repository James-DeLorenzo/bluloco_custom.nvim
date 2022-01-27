local colorscheme = require("bluloco_custom")
local lushwright = require("shipwright.transform.lush")


run(colorscheme,
    lushwright.to_vimscript,
    {append, {"set bg=dark", "let g:colors_name=\"bluloco_custom\""}},
    {overwrite, "bluloco_custom/colors/bluloco_custom.vim"})
