let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .config/nvim/
edit ~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 26 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 59 + 59) / 119)
exe '2resize ' . ((&lines * 26 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 59 + 59) / 119)
exe '3resize ' . ((&lines * 21 + 25) / 51)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 51 - ((3 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 025|
wincmd w
argglobal
if bufexists("~/Repos/hu-ops/scripts/helpers/dns/domain-management/domain-management-r53.py") | buffer ~/Repos/hu-ops/scripts/helpers/dns/domain-management/domain-management-r53.py | else | edit ~/Repos/hu-ops/scripts/helpers/dns/domain-management/domain-management-r53.py | endif
if &buftype ==# 'terminal'
  silent file ~/Repos/hu-ops/scripts/helpers/dns/domain-management/domain-management-r53.py
endif
balt ~/Repos/hu-ops/scripts/helpers/dns/domain-management/
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 74 - ((3 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 74
normal! 09|
wincmd w
argglobal
if bufexists("~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua") | buffer ~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua | else | edit ~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua | endif
if &buftype ==# 'terminal'
  silent file ~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua
endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
135
normal! zo
135
normal! zc
let s:l = 233 - ((10 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 233
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 26 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 59 + 59) / 119)
exe '2resize ' . ((&lines * 26 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 59 + 59) / 119)
exe '3resize ' . ((&lines * 21 + 25) / 51)
tabnext 1
badd +218 ~/workspaces/nvim_theme/lua/lush_theme/lush_template.lua
badd +88 ~/workspaces/nvim_theme/bluloco-dark-color-theme.json
badd +1 ~/workspaces/nvim_theme/colors/lush_template.lua
badd +48 ~/.config/nvim/lua/keybinds.lua
badd +133 /var/folders/c8/ynsc88b54_s8h2fwvn_90zqh0000gn/T/nvimCkHdO1/2
badd +1 ~/Repos/hu-ops/scripts/helpers/dns/domain-management/
badd +0 ~/Repos/hu-ops/scripts/helpers/dns/domain-management/domain-management-r53.py
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
