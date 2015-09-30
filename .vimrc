" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible              " required by Vundle
filetype off                  " required by Vundle

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'scrooloose/nerdtree'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'tpope/vim-endwise'                    " Adds end automatically to methods etc
Plugin 'ervandew/supertab'                    " tab auto-complete for words
" Easily switch between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

" ruby debug abbrev
iabbr bb byebug
map <Leader>bb orequire 'byebug'; byebug<esc>:w<cr>
map <Leader>yy orequire 'pry'; binding.pry<esc>:w<cr>

"" Easy copy pasting
vnoremap cc :w !pbcopy<CR><CR>
noremap vv :r !pbpaste<CR>

"hit v to select one character
""hit v again to expand selection to word
"hit v again to expand to paragraph
"hit <c-v> go back to previous selection if i went too far
vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

" Bundles from other people I need to learn more about
" ----------------------------------------------------
" Plugin 'tpope/vim-fugitive' " (Will Faurot)
" Plugin 'scrooloose/syntastic' " (Will Faurot)
 Plugin 'kien/ctrlp.vim' " (Will Faurot) # fuzzy finder
" Plugin 'vim-ruby/vim-ruby' " (Will Faurot)
" Plugin 'tpope/vim-rails' " (Will Faurot)
" Plugin 'pangloss/vim-javascript' " (Will Faurot)
" Plugin 'tpope/vim-fugitive' " (Will Faurot)
" Plugin 'terryma/vim-multiple-cursors' " (Will Faurot)
" Plugin 'tpope/vim-ragtag' " (Will Faurot)
" Plugin 'elixir-lang/vim-elixir' (Ben Orenstein)
" Plugin 'ervandew/supertab' (Ben Orenstein)
" Plugin 'kchmck/vim-coffee-script' (Ben Orenstein)
" Plugin 'koron/nyancat-vim' (Ben Orenstein)
" Plugin 'skwp/greplace.vim' (Ben Orenstein)
" Plugin 'tomtom/tcomment_vim' (Ben Orenstein)
" Plugin 'thoughtbot/vim-rspec' (Ben Orenstein)
" Plugin 'tpope/vim-bundler' (Ben Orenstein)
" Plugin 'tpope/vim-cucumber' (Ben Orenstein)
" Plugin 'tpope/vim-dispatch' (Ben Orenstein)
" Plugin 'tpope/vim-endwise' (Ben Orenstein)
" Plugin 'tpope/vim-repeat' (Ben Orenstein)
" Plugin 'tpope/vim-surround' (Ben Orenstein)
" Plugin 'tpope/vim-unimpaired' (Ben Orenstein)
" Plugin 'wincent/Command-T' (Ben Orenstein)
" nelstrom's plugin depends on kana's
Plugin 'scrooloose/nerdcommenter'
" -----------------------------------
" Plugin 'kana/vim-textobj-user' (Ben Orenstein)
" Plugin 'nelstrom/vim-textobj-rubyblock' (Ben Orenstein)

" Clojure
" -------
" Plugin 'guns/vim-clojure-static' (Ben Orenstein)
" Plugin 'tpope/vim-classpath' (Ben Orenstein)
" Plugin 'tpope/vim-fireplace' (Ben Orenstein)
" Plugin 'tpope/vim-leiningen' (Ben Orenstein)

" Colors
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme jellybeans

set t_Co=256
syntax enable                   " enable syntax highlighting
set encoding=utf-8
set showcmd                     " display incomplete commands

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

" https://github.com/JoshCheek/dotfiles
" set nobackup                  " no backup files '(Josh Cheeks)
" set nowritebackup             " only in case you don't want a backup file while editing '(Josh Cheeks)
set noswapfile                 " no swap files '(Josh Cheeks)
" set scrolloff=4               " adds top/bottom buffer between cursor and window '(Josh Cheeks)
set cursorline                 " colours the line the cursor is on '(Josh Cheeks)
set number                     " line numbers '(Josh Cheeks)

" c command mode: command terminal mode
" n normal mode: start in vim
"' i insert mode: insert in vim
" v visual mode: visual mode in vim

" Easier navigation between split windows

" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" rebind esc to something more easily reachable, popular alternatives are jj, jk, ii
" imap kj <Esc>

" leader keybinds
" ex. for pry insertion you'd hit ,p
" let mapleader="," " remap leader to comma
 map <Leader>p orequire "pry"; binding.pry<esc>
" map <Leader>cl oconsole.log();<esc>hi
" map <Leader>de odebugger;<esc>:w %<cr>
map <Leader>flash o<div class="messages"><cr><% flash.each do \|name, msg\| %><cr><%= content_tag :div, msg, class: "flash-#{name}" %><cr><% end %><cr></div>

" Emacs/Readline keybindings for commandline/insert mode
" These can be helpful in insert mode for small movements as opposed to having
" to switch back to normal mode
"
"navigation
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" cnoremap <C-f> <Right>
" cnoremap <C-b> <Left>
" cnoremap <M-b> <S-Left>
" cnoremap <M-f> <S-Right>
" insert mode
" imap <C-b> <Left>
" imap <C-f> <Right>
" imap <C-a> <Home>
" imap <C-e> <End>
map <C-i> :NERDTreeToggle<CR>
inoremap jk <esc>
inoremap kj <esc>

" ================ Leader and other mappings =======================
" leader map with leader commands
let mapleader = "\,"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :CtrlP<CR>
nmap <Leader><Leader> V
nnoremap <Leader>i mzgg=G`z<CR>

" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"" ==========  Pathogen, vim path manager (https://github.com/tpope/vim-pathogen#readme)  ==========
"call pathogen#infect()


"" ==========  Powerline, toolbar (https://github.com/Lokaltog/vim-powerline/) ==========
"let g:Powerline_symbols = 'compatible'
"let g:Powerline_stl_path_style = 'relative'
"set laststatus=2   " Always show the statusline
"set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors


" got this list from here: https://github.com/Lokaltog/vim-powerline/blob/c4b72c5be57b165bb6a89d0b8a974fe62c0091d0/autoload/Powerline/Themes/default.vim
"call Pl#Theme#RemoveSegment('fugitive:branch')
"call Pl#Theme#RemoveSegment('syntastic:errors')
"call Pl#Theme#RemoveSegment('fileformat')
"call Pl#Theme#RemoveSegment('fileencoding')
"call Pl#Theme#RemoveSegment('filetype')
"" call Pl#Theme#RemoveSegment('lineinfo')           " Line number and column length

"========== Testing ==========
" alias="gem 'minitest', '~> 5.2'\nrequire 'minitest/autorun'\require 'minitest/pride'i\nrequire 'pry'"

" Seeing Is Believing
nmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)
xmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)
imap <buffer> <Leader>r <Plug>(seeing-is-believing-run)

set clipboard=unnamed
