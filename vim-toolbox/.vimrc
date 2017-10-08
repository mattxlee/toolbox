set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'a.vim' "ctrl+h to switch head/source file
Plugin 'TaskList.vim' "ctrl+t to show all TODO tag of current file
Plugin 'DoxygenToolkit.vim' "Doxydoc to add comments of current code
Plugin 'Conque-GDB' "GDB support
Plugin 'ShowTrailingWhitespace' "Show white space characters
Plugin 'rking/ag.vim' "quick find, ctrlsf.vim depends on it
Plugin 'dyng/ctrlsf.vim' "ctrl+g to search in files
Plugin 'terryma/vim-multiple-cursors' "ctrl+n to select multiply words
Plugin 'uarun/vim-protobuf' "protobuf file highlights
Plugin 'scrooloose/nerdtree' "ctrl+j to open it
Plugin 'airblade/vim-gitgutter' "git status of current file
Plugin 'tpope/vim-fugitive' "git command support
Plugin 'kien/ctrlp.vim' "ctrl+p to choose file
Plugin 'bling/vim-airline' "beauty status-bar
Plugin 'tomtom/tcomment_vim' "gc to make comment of selected lines
Plugin 'gcmt/wildfire.vim' "enter to select current range
Plugin 'rhysd/vim-clang-format' "shift+c to format code
Plugin 'tpope/vim-surround' "Surround for tags or strings
Plugin 'mattn/emmet-vim' "Plugin for html editor
Plugin 'pangloss/vim-javascript' "Enhance javascript syntax display
Plugin 'hdima/python-syntax' "Enhance python syntax display
Plugin 'godlygeek/tabular' "Vim script for text filtering and alignment
Plugin 'plasticboy/vim-markdown' "Markdown syntax highlights
Plugin 'dcharbon/vim-flatbuffers' "FlatBuffers file support
Plugin 'leafgarland/typescript-vim' "TypeScript language support
Plugin 'editorconfig/editorconfig-vim' "Editor config file manager
Plugin 'vim-syntastic/syntastic' "Syntax checker
Plugin 'eslint/eslint' "Javascript syntax checker

" ==== You complete me ====
" Plugin 'ervandew/supertab'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" ==== You complete me ====

Plugin 'morhetz/gruvbox' "Gruvbox colorscheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" ==== You complete me ====
" let g:ycm_confirm_extra_conf=0
" let g:ycm_show_diagnostics_ui=1
" ==== You complete me ====

let c_no_curly_error=1
let g:bookmark_auto_close=1
let g:user_emmet_mode='i'

let g:ctrlp_by_filename=1
let g:ctrlp_working_path_mode='a'

let g:clang_format#code_style='google'
let g:clang_format#detect_style_file=1

let g:ConqueTerm_StartMessages=0
let g:ConqueTerm_Color=2
let g:ConqueTerm_CloseOnEnd=1

let g:NERDTreeWinSize=40
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']

syntax enable

let g:gruvbox_termcolors=256
silent! colorscheme gruvbox
set background=dark

set nu
set hls
set sw=2
set ts=2
set cc=81
set expandtab
set laststatus=2
set nocompatible
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=1

" Use LEADER + W to clear trailing spaces.
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" ==== You complete me ====
" map <C-K> :YcmCompleter GoTo<CR>
" map B :YcmDiags<CR>
" ==== You complete me ====

map <C-T> :TaskList<CR>
map <C-J> :NERDTreeFind<CR>
map <C-H> :A<CR>
map <C-L> :CtrlSF -G .*
map <C-G> :Gstatus<CR>
map K :on<CR>
map L :CtrlSFToggle<CR>
map C :ClangFormat<CR>
map M :Dox<CR>

highlight Visual cterm=None ctermfg=Black ctermbg=Blue
highlight LineNr cterm=None ctermfg=243 ctermbg=237
highlight Todo ctermfg=121
