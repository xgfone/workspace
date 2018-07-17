"====================================================================
"                Customized  SpaceVim Configuration
"====================================================================

func! myspacevim#before() abort
    set nocompatible
    filetype plugin indent on

    " Disable the unused vim built-in plugins
    let g:loaded_gzip = 0
    let g:loaded_2html_plugin = 0
    let g:loaded_getscriptPlugin = 0
    let g:loaded_gzip = 0
    let g:loaded_logipat = 0
    let g:loaded_matchparen = 0
    let g:loaded_netrwPlugin = 0
    let g:loaded_rrhelper = 0
    let g:loaded_spellfile_plugin = 0
    let g:loaded_tarPlugin = 0
    let g:loaded_vimballPlugin = 0
    let g:loaded_zipPlugin = 0

    " Set the maximum width of each line.
    set textwidth=120
    autocmd FileType text setlocal textwidth=0

    set timeout " For mapping
    set timeoutlen=400 " The default delay time(ms)
    set synmaxcol=200 " Set the max highlight columns
    set colorcolumn=80,100,120 " Set the color columns

    " Source the vimrc file after saving it
    autocmd BufWritePost $MYVIMRC source $MYVIMRC

    " Strip the whitespace by default when saving.
    "autocmd BufEnter * StripWhitespace  " Toggle to load the plugin ntpeters/vim-better-whitespace
    "autocmd BufEnter * EnableStripWhitespaceOnSave


    "==================================================================
    "                          Key mapping
    "==================================================================
    "map <F9> :StripWhitespace<CR>
    "imap <F9> :StripWhitespace<CR>
    "noremap <silent> <F8> :TagbarToggle<CR>

endf
