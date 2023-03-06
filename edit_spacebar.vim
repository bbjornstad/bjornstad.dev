let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/prj/bjornstad.dev
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +19 ~/prj/bjornstad.dev/templates/spacebar.html
badd +1 ~/prj/bjornstad.dev/templates/home.html
badd +63 ~/prj/bjornstad.dev/config.toml
argglobal
%argdel
edit ~/prj/bjornstad.dev/templates/spacebar.html
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
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
exe 'vert 1resize ' . ((&columns * 20 + 85) / 171)
exe 'vert 2resize ' . ((&columns * 74 + 85) / 171)
exe 'vert 3resize ' . ((&columns * 75 + 85) / 171)
argglobal
enew
file NvimTree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt ~/prj/bjornstad.dev/templates/home.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
13,17fold
20,23fold
12,24fold
let &fdl = &fdl
let s:l = 10 - ((9 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/prj/bjornstad.dev/templates/home.html", ":p")) | buffer ~/prj/bjornstad.dev/templates/home.html | else | edit ~/prj/bjornstad.dev/templates/home.html | endif
if &buftype ==# 'terminal'
  silent file ~/prj/bjornstad.dev/templates/home.html
endif
balt ~/prj/bjornstad.dev/templates/spacebar.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
12,16fold
11,17fold
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 20 + 85) / 171)
exe 'vert 2resize ' . ((&columns * 74 + 85) / 171)
exe 'vert 3resize ' . ((&columns * 75 + 85) / 171)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
