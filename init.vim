" vim: foldmethod=marker

"{{{Vim-Plug Plugins

call plug#begin('~/.local/share/nvim/plugged')
" Statusline
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'
" Code Completion and Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/ListToggle'
" Tag bar
Plug 'liuchengxu/vista.vim'
" Indentation Delection
Plug 'vim-scripts/GuessIndent'
" Debugging
Plug 'puremourning/vimspector'
" Git
Plug 'tpope/vim-fugitive'
" Fuzzy find files
Plug 'junegunn/fzf.vim'
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
" Working with tags
" Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
" Commenting
Plug 'tpope/vim-commentary'
" Syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" TypeScript Syntax
Plug 'HerringtonDarkholme/yats.vim'
" Svelte Syntax
Plug 'leafOfTree/vim-svelte-plugin'
" An always-on highlight for a unique character in every word on a line to help you use f, F and family
" Plug 'unblevable/quick-scope'
"  A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'
" Org-mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Table Editor
Plug 'dhruvasagar/vim-table-mode'
" Start Screen
Plug 'mhinz/vim-startify'
" Basic actions, rename, chmod, etc...
Plug 'tpope/vim-eunuch'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" Icons
Plug 'ryanoasis/vim-devicons'
" NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdtree'

call plug#end()

"}}}

"{{{Coc.nvim Plugins

let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-omnisharp',
			\ 'coc-diagnostic',
			\ 'coc-eslint',
			\ 'coc-emmet',
			\ 'coc-rust-analyzer',
			\ 'coc-go',
			\ 'coc-svelte',
			\ 'coc-smartf'
			\ ]

"}}}

"{{{Basic Settings

let mapleader=";"

" Syntax Highlighting
syntax on
" Mouse Support
set mouse=a
set ignorecase
set smartcase
set encoding=utf-8
set number relativenumber
" Use true-color
set termguicolors
" Do not show mode
set noshowmode

" Decrease delays (from Coc README)
set updatetime=300

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Theme
colorscheme codedark

" Use 2-space-wide tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set noexpandtab

" Fold by syntax
set foldmethod=syntax
" Open all folds by default
set foldlevelstart=9999

" Split config
set splitbelow splitright

" Use system clipboard
set clipboard+=unnamedplus

"}}}

"{{{Binds

" Set filetype
map <leader>sft :set filetype=

" Enable/Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Enable/Disable auto comment
map <leader>c :setlocal	formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Quit
map <C-q> :q<CR>
map <C-Q> :wq<CR>

" Shortcutting split navigation
map <silent> <A-h> :wincmd h<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-k> :wincmd k<CR>
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-j> :wincmd j<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-l> :wincmd l<CR>
map <silent> <A-Right> :wincmd l<CR>

" Tabs
map <A-Tab> :tabnext<CR>
map <A-w> :tabclose<CR>
map <A-t> :tabnew<CR>

" Shortcut split open
map <leader>h :split<Space>
map <leader>v :vsplit<Space>

map <leader>tv :vsplit term://$SHELL<CR>
map <leader>th :split term://$SHELL<CR>

" Alias replace all to S
map S :%s//gI<Left><Left><Left>

" Alias write and quit to Q
map <leader>q :wq<CR>
map <leader>w :w<CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" Fzf
map ;tf :Files<CR>


" coc-smartf
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
	autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
	autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

"}}}

"{{{Explorer and Startify

" Disable netrw
let g:loaded_netrw = 1
let g:netrw_loaded_netrwPlugin = 1

" NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1

" Open directory with NERDTree and Startify
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd '.argv()[0] | Startify | exe 'NERDTree' argv()[0] | wincmd l | endif

" Exit vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree and Startify if no args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | NERDTree | wincmd l | endif

" Open coc explorer at cwd
" function CocExplorerToggle()
" 	exe 'CocCommand explorer ' . getcwd()
" endfunction

map <silent> ;tr :NERDTreeToggle<CR>

" Auto exit if coc-explorer is last buffer left
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Open startify instead of netrw when opening directory
" augroup cocExplorer
"     au!
"     au VimEnter * sil! au! FileExplorer *
"     au BufEnter * if s:isdir(expand('%')) | bd | exe 'cd ' . argv()[0] | exe 'Startify' | endif
" augroup END


" fu! s:isdir(dir) abort
"     return !empty(a:dir) && (isdirectory(a:dir) ||
"                 \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
" endfu

" Open startify and coc-explorer if no args
" autocmd VimEnter * if argc() < 1 | exe 'Startify' | endif

"}}}

"{{{Quick-Scope

let g:qs_highlight_on_keys = ['f', 'F']

"}}}

"{{{CloseTag Config

" Filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
			\ 'typescript.tsx': 'jsxRegion,tsxRegion',
			\ 'javascript.jsx': 'jsxRegion',
			\ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"}}}

"{{{Debugging options and binds

let g:vimspector_enable_mappings = 'HUMAN'
map <F27> :VimspectorReset<CR>

"}}}

"{{{Coc Settings and Binds

set wildmode=longest,list,full

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" map <leader>r :lopen<CR>
let g:lt_location_list_toggle_map = '<leader>rl'
let g:lt_quickfix_list_toggle_map = '<leader>rq'
map <leader>rd :CocList diagnostics<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Format with CoC or with ESLint
map ;ff :Format<CR>
map ;fe :CocCommand eslint.executeAutofix<CR>

"}}}

"{{{Statusline

" Coc status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}

" Vim-airline
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme = 'codedark'

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
			\ 'colorscheme': 'codedark',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'cocstatus', 'coccurrentfunction'], 
			\             ['readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'cocstatus': 'coc#status',
			\   'coccurrentfunction': 'CocCurrentFunction'
			\ },
			\ }

"}}}
