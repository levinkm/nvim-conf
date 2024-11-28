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
badd +324 lib/features/dashboard/components/home/home.dart
badd +140 health://
badd +552 lib/features/dashboard/components/home/wallet_detail.dart
badd +324 ~/dev/work/FedhaApp/lib/features/dashboard/components/bills/bills.dart
argglobal
%argdel
edit ~/dev/work/FedhaApp/lib/features/dashboard/components/bills/bills.dart
argglobal
balt lib/features/dashboard/components/home/home.dart
let s:cpo_save=&cpo
set cpo&vim
onoremap <buffer> <silent> af <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer','textobjects','o')
xnoremap <buffer> <silent> af <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer','textobjects','x')
onoremap <buffer> <silent> ac <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer','textobjects','o')
xnoremap <buffer> <silent> ac <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer','textobjects','x')
onoremap <buffer> <silent> if <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner','textobjects','o')
xnoremap <buffer> <silent> if <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner','textobjects','x')
onoremap <buffer> <silent> ic <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner','textobjects','o')
xnoremap <buffer> <silent> ic <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner','textobjects','x')
let &cpo=s:cpo_save
unlet s:cpo_save
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
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:���
setlocal commentstring=
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
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_b_command#\ \ new_ui\ %#lualine_b_diagnostics_info_command#\ I:1\ %#lualine_transitional_lualine_b_diagnostics_info_command_to_lualine_c_normal#%<%#lualine_c_normal#\ lib/features/dashboard/components/bills/bills.dart\ %#lualine_c_normal#%=%#lualine_c_normal#\ utf-8\ %#lualine_c_normal#\ \ %#lualine_x_filetype_DevIconDart_command#\ \ %#lualine_c_normal#dart\ %#lualine_transitional_lualine_b_command_to_lualine_c_normal#%#lualine_b_command#\ 99%%\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_a_command#\ 324:21\ 
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
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
setlocal winbar=%#barbecue_normal#\ %#barbecue_dirname#lib%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %#barbecue_dirname#features%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %#barbecue_dirname#dashboard%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %#barbecue_dirname#components%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %#barbecue_dirname#bills%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %@v:lua.require'barbecue.ui.mouse'.navigate_1000_1_0@%#barbecue_fileicon_Dart#%#barbecue_normal#\ %#barbecue_basename#bills.dart%X%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %@v:lua.require'barbecue.ui.mouse'.navigate_1000_320_0@%#barbecue_context_class#\ %#barbecue_normal#\ %#barbecue_context#_ChartData%X%#barbecue_normal#\ %#barbecue_separator#>%#barbecue_normal#\ %@v:lua.require'barbecue.ui.mouse'.navigate_1000_324_15@%#barbecue_context_field#\ %#barbecue_normal#\ %#barbecue_context#color%X%#barbecue_normal#%=%#barbecue_normal#\ 
setlocal winblend=0
setlocal nowinfixbuf
setlocal winfixheight
setlocal winfixwidth
setlocal winhighlight=
setlocal nowrap
setlocal wrapmargin=0
let s:l = 324 - ((309 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 324
normal! 021|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
