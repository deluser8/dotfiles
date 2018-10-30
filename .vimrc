set nocompatible
set modeline
set modelines=4
let mapleader=","

augroup encoding

    autocmd!
    set encoding=utf-8 nobomb
    set fileencodings=utf-8,ucs-bom,utf-16,gbk,big5,gb18030,latin1,cp936
augroup end
augroup mixin
    autocmd!

    syntax on
    set ruler
    set number
    set showcmd
    set incsearch
    set hlsearch
    set nobk
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set helplang=cn
    set ttymouse=xterm2
    set termencoding=utf-8
    set encoding=utf-8
augroup end

augroup solveesc
    inoremap jk <esc>
augroup end

" Write file {{{
augroup write_file
    autocmd!
    map <F2> :w<CR>
    " Sudo write (,w / :w!!)
    " noremap <leader>w :w !sudo tee % > /dev/null<CR>
    cmap w!! w !sudo tee %
augroup end
                     " }}}

" NERDTree {{{
augroup nerdtree_config
    autocmd!
    map <C-n> :NERDTreeToggle<CR>
    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
augroup end
" }}}

" Search {{{
augroup search_config
    autocmd!

    set gdefault " By default add g flag to search/replace. Add g to toggle
    set hlsearch " Highlight searches
    set ignorecase " Ignore case of searches
    set incsearch " Highlight dynamically as pattern is typed
    set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters

    " <F3> for canceling hightlight after search
    map <F3> :nohl<CR>
augroup end
"                                 " }}}

" Vim-easymotion {{{
augroup vim_easymotion
autocmd!
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
    let g:EasyMotion_startofline = 0 " keep cursor column whenJK motion

    " Jump to anywhere you want with minimal keystrokes,
    " with just one key binding.
    " `s{char}{label}`
    " nmap s <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)
    
    " hjkl motions
    map <Leader>h <Plug>(easymotion-linebackward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>l <Plug>(easymotion-lineforward)
augroup end

" Vim-airline {{{
augroup airline_config
    autocmd!
    let g:airline_theme='dark'
    let g:airline#extensions#tabline#enabled=1
augroup end
"              }}}"                                                 " }}}

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins {{{
call plug#begin('~/.vim/plugged')

" Beautify
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'Yggdroot/indentLine'

" Code navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

" Auto complete
Plug 'vim-scripts/L9'
Plug 'othree/vim-autocomplpop'

" fzf
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()
" }}}

