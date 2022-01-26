local colorscheme = require("my_theme.lush_theme.lush_template")
local lushwright = require("shipwright.transform.lush")


run(colorscheme,
    lushwright.to_vimscript,
    {append {"set bg=dark", "let g:colors_name=\"lush_template\""}},
    {overwrite, "colors/lush_template.vim"})
