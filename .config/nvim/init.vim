syntax on
syntax enable
set nocompatible

" Enable true colour support
if has('termguicolors')
  set termguicolors
endif

" Search down into subfolders
set path+=**
set number
set relativenumber
set background=dark
set cursorline
" Enable tab-completion
set wildmenu
set wildmode=full
set lazyredraw
set showmatch " Highlight matching parentheses, etc
set incsearch
set hlsearch
set complete=.,w,b,u,t,i,kspell
filetype plugin indent on
runtime macros/matchit.vim

" On pressing tab, insert 2 spaces
set expandtab
" Show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
set foldenable
set foldlevelstart=10
set foldmethod=indent  " fold based on indent level 
set history=2000
"Increment numbers in decimal format
set nrformats-=octal
"Persist undos between sessions
set undofile
autocmd BufWritePre /tmp/* setlocal noundofile
"Split right and below
set splitright
set splitbelow

" Turn off search highlight by mapping :nohlsearch to space
nnoremap <leader><space> :nohlsearch<CR>

" Terminal
nnoremap <leader>t :below terminal<CR>

" Buffer list navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Quickfix list navigation
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <C-c> :call ToggleQuickFix()<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>
" Location list navigation
nnoremap <silent> <C-l> :lopen<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :Lfirst<CR>
nnoremap <silent> ]L :Llast<CR>

" Resize split windows with leader +/-
nnoremap <silent> <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <space>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <space>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Shortcut for expanding to current buffer's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand("%:h')'/' : '%%' 


if has('nvim')
  "Remap Esc to switch to normal mode and Ctrl-Esc to pass Esc to terminal
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Plugins
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac') " Plugin manager
call minpac#add('bfredl/nvim-luadev') " Adds :Luadev command (REPL like environment)
call minpac#add('tyru/open-browser.vim') " Dependency of plantuml-previewer
call minpac#add('aklt/plantuml-syntax') " Dependency of plantuml-previewer
call minpac#add('weirongxu/plantuml-previewer.vim') 
" call minpac#add('puremourning/vimspector')
call minpac#add('chaoren/vim-wordmotion') " CamelCase, snake_case, etc word motions
call minpac#add('sheerun/vim-polyglot')
call minpac#add('justinmk/vim-sneak') " Remaps s [cl] and S [cc] to vertical sneak search.
call minpac#add('pangloss/vim-javascript')
call minpac#add('kana/vim-textobj-user') " User-defined textobjects
call minpac#add('christoomey/vim-system-copy') " Keybindings for system clipboard copy
call minpac#add('editorconfig/editorconfig-vim') " .editorconfig support
call minpac#add('tpope/vim-fugitive') " Git wrapper
call minpac#add('tpope/vim-rhubarb') " GitHub futitive plugin for :GBrowse
call minpac#add('tommcdo/vim-fubitive') " Bitbucket fugitive plugin for :GBrowse
call minpac#add('tpope/vim-repeat') " Add repeat . support to custom commands
call minpac#add('tpope/vim-commentary') " Keybindings for commening/uncommenting
call minpac#add('tpope/vim-unimpaired') " Navigation with [ and ] keybindings
call minpac#add('tpope/vim-dispatch') 
call minpac#add('tpope/vim-obsession') " Automatic session management
call minpac#add('udalov/kotlin-vim') " Highlighting for Kotlin. Also required for Kotlin LSP support
call minpac#add('tomasiser/vim-code-dark') " Color theme
call minpac#add('kaicataldo/material.vim', { 'branch': 'main' }) " Color theme
call minpac#add('Yggdroot/indentLine') " Display thin vertical lines at each indentation level for code indented with spaces
" call minpac#add('mrcjkb/neomake', {'branch': 'gradle-kotlin-dsl-support'})
"call minpac#add('neomake/neomake')
call minpac#add('vim-test/vim-test')
" call minpac#add('mrcjkb/vim-test', {'branch:': 'gradle-kotlin-dsl-support'})
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
" call minpac#add('MrcJkb/nvim-lspconfig', {'branch:': 'feature/arduino-language-server'})
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/lsp-status.nvim')
call minpac#add('ray-x/lsp_signature.nvim') " LSP autocomplete signature hints
call minpac#add('RishabhRD/popfix') " Dependency of lsputils
call minpac#add('RishabhRD/nvim-lsputils') " LSP floating popups, etc.
call minpac#add('onsails/lspkind-nvim') " Autocomplete icons
call minpac#add('nvim-lua/completion-nvim')
call minpac#add('codota/tabnine-vim') " TabNine/Codota auto completions
call minpac#add('aca/completion-tabnine', { 'do': './install.sh' })
call minpac#add('nvim-treesitter/nvim-treesitter') 
call minpac#add('nvim-treesitter/nvim-treesitter-textobjects') " Treesitter-based text objects
call minpac#add('p00f/nvim-ts-rainbow') " Rainbow brackets (needs nvim-treesitter)
call minpac#add('mfussenegger/nvim-jdtls') " Java LSP support
call minpac#add('mfussenegger/nvim-dap') " Debug Adapter Protocol
call minpac#add('mfussenegger/nvim-dap-python')
call minpac#add('theHamsta/nvim-dap-virtual-text')
call minpac#add('jbyuki/one-small-step-for-vimkind') " Debug Adapter for neovim/lua
call minpac#add('scalameta/nvim-metals') " Scala LSP support
call minpac#add('simrat39/rust-tools.nvim')
call minpac#add('norcalli/snippets.nvim') " Snippet support
call minpac#add('SirVer/ultisnips')
call minpac#add('nvim-lua/popup.nvim')
call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('nvim-telescope/telescope.nvim')
call minpac#add('tjdevries/nlua.nvim') " Lua development for neovim
call minpac#add('folke/lua-dev.nvim') " Lua development for neovim
" Fuzzy search
call minpac#add('junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('monkoose/fzf-hoogle.vim')
call minpac#add('vim-airline/vim-airline') " Status line at the bottom
call minpac#add('kevinhwang91/rnvimr', {'do': 'make sync'})
call minpac#add('ryanoasis/vim-devicons')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

let g:dap_virtual_text = v:true

"vim-wordmotion
let g:wordmotion_mappings = {
\ 'w' : '<M-w>',
\ 'b' : '<M-b>',
\ 'e' : '<M-e>',
\ 'ge' : 'g<M-e>',
\ 'aw' : 'a<M-w>',
\ 'iw' : 'i<M-w>',
\ '<C-R><C-W>' : '<C-R><M-w>'
\ }
" Sneak
let g:sneak#label = 1
let g:sneak#prompt = '🔍'
" Replace f and F with Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Telescope
nnoremap <C-p> :<C-u>Telescope find_files<CR>
nnoremap <C-g> :<C-u>Telescope live_grep<CR>
nnoremap <C-s> :<C-u>Telescope grep_string<CR>
nnoremap <leader>tg :<C-u>Telescope git_files<CR>

" colorscheme codedark
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material
let g:airline_theme = 'material'


let g:polyglot_disabled = ['java']

let g:neomake_java_gradle_executable = 'gw'

let test#strategy = "neovim"
let test#java#runner = 'gradletest'

if has('nvim')
  "Highlight terminal cursor
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
  "Prevent nested nvim instances
  if executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait + 'set bufhidden=wipe'"
  endif
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" -------------------------- Tree-Sitter --------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF

" completion-nvim
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'tabnine']},
    \{'complete_items': ['snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'},
    \{'mode': 'defs'},
    \{'mode': 'dict'},
    \{'mode': 'file'},
    \{'mode': 'line'},
    \{'mode': 'dict'},
    \{'mode': 'spel'},
\]


imap <M-j> <Plug>(completion_next_source)
imap <M-k> <Plug>(completion_prev_source)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
"set shortmess+=c

" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



" ------------------- Snippets.nvim ---------------------------
lua require'snippets'.use_suggested_mappings()
" This variant will set up the mappings only for the *CURRENT* buffer.
" There are only two keybindings specified by the suggested keymappings, which is <C-k> and <C-j>
" They are exactly equivalent to:
" <c-k> will either expand the current snippet at the word or try to jump to
" the next position for the snippet.
inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
" <c-j> will jump backwards to the previous field.
" If you jump before the first field, it will cancel the snippet.
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>
" ------------------- Snippets.nvim ---------------------------
"
source $VIMCONFIG/vimscript/rnvimr.vim
source $VIMCONFIG/vimscript/coc.vim
lua require('lspconfig-setup')
lua require('dap-setup')
lua require('lsputils-config')
lua require('telescope-config')
lua require('treesitter-config')
