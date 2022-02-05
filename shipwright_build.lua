local colorscheme = require("bluloco.bluloco_custom")
local lushwright = require("shipwright.transform.lush")


run(colorscheme,
    lushwright.to_vimscript,
    {append, {"set bg=dark", "let g:colors_name=\"bluloco_custom\""}},
    {overwrite, "colors/vim/bluloco_custom.vim"})
