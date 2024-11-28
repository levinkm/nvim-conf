let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/work/FedhaApp
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 devtools_options.yaml
badd +140 health://
badd +3 pubspec.lock
badd +120 lib/fedhaapp.dart
badd +2 lib/utils/transactions_utils.dart
badd +30 lib/main.dart
badd +5 dart/query_editor.scm
argglobal
%argdel
edit lib/fedhaapp.dart
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=80
setlocal comments=sO:*\\\ -,mO:*\\\ \\\ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'dart'
setlocal filetype=dart
endif
setlocal fillchars=fold:\ 
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=v:lua.require'ufo.main'.foldtext()
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=tcqj
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=v:lua.require('flutter-tools.resolve_url').resolve_url(v:fname)
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%<%#lualine_c_inactive#\ FedhaApp/lib/fedhaapp.dart\ %#lualine_c_inactive#%=%#lualine_c_inactive#\ 120:1\ \ 
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'dart'
setlocal syntax=dart
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=%#barbecue_normal#\ %#barbecue_dirname#FedhaApp%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %#barbecue_dirname#lib%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %@v:lua.require'barbecue.ui.mouse'.navigate_1009_1_0@%#barbecue_fileicon_Dart#%#barbecue_normal#\ %#barbecue_basename#fedhaapp.dart%X%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %@v:lua.require'barbecue.ui.mouse'.navigate_1009_46_0@%#barbecue_context_class#\ %#barbecue_normal#\ %#barbecue_context#MyApp%X%#barbecue_normal#%=%#barbecue_normal#\ 
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal nowrap
setlocal wrapmargin=0
let s:l = 120 - ((48 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 120
normal! 0
lcd ~/dev/work
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
