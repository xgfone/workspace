"====================================================================
"                Customized  SpaceVim Configuration
"====================================================================

" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#c')
"call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
"call SpaceVim#layers#load('lang#haskell')
"call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
"call SpaceVim#layers#load('lang#lua')
"call SpaceVim#layers#load('lang#perl')
"call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
"call SpaceVim#layers#load('lang#rust')
"call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('shell')
"call SpaceVim#layers#load('tools#screensaver')
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint')
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint')
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

"let g:spacevim_lint_on_the_fly = 0
let g:spacevim_lint_on_save = 1
let g:airline_powerline_fonts = 1
let g:spacevim_default_indent = 4
let g:spacevim_relativenumber = 0
let g:spacevim_colorscheme = 'one'
let g:spacevim_guifont = 'DejaVu\ Sans\ Mono\ for\ Powerline\ 14'
let g:spacevim_colorscheme = "one"
let g:spacevim_colorscheme_bg = "light"


"===================================================================
"               Customized Vim/NeoVim Configuration
"===================================================================
"--------------------------------------
"  => General
"--------------------------------------
set nocompatible
filetype plugin indent on

let mapleader = ';'
let g:mapleader = ';'

" Disable the unused vim built-in plugins
let g:loaded_gzip = 0
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

set timeout " For mapping
set timeoutlen=400 " The default delay time(ms)

set synmaxcol=200 " Set the max highlight columns

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Strip the whitespace by default when saving.
"autocmd BufEnter * StripWhitespace  " Toggle to load the plugin ntpeters/vim-better-whitespace
"autocmd BufEnter * EnableStripWhitespaceOnSave
map <F9> :StripWhitespace<CR>
