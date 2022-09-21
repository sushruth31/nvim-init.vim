set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'navarasu/onedark.nvim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sainnhe/gruvbox-material'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sainnhe/edge'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'pangloss/vim-javascript'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'sainnhe/sonokai'
Plug 'nvim-treesitter/nvim-treesitter-context'
call plug#end()

lua<< EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = 'all',

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
   ignore_install = { "phpdoc" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF

lua<< EOF
require'treesitter-context'.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        show_all_context = show_all_context,
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },

            rust = {
                "loop_expression",
                "impl_item",
            },

            typescript = {
                "class_declaration",
                "abstract_class_declaration",
                "else_clause",
            },
        },
    })
EOF
let g:CommandTPreferredImplementation='lua'
let mapleader=' '
set guicursor=
let NERDTreeShowHidden=1
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log(<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
set sidescrolloff=7
set sidescroll=1
set splitbelow
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" exitinging vim shortcuts
"nmap <Leader>q :q<CR>
"nmap <Leader>qa :qa<CR>
"nmap <Leader>wq :wq<CR>
nmap <Leader>wa :wa<CR>
nmap <Leader>w :w<CR>
"nmap <Leader>x :x<CR>
"nmap <Leader>n :vs ene<CR>
tnoremap <Esc> <C-\><C-n>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-pairs', 'coc-emmet', 'coc-highlight', 'coc-yank']
au BufRead,BufNewFile *.ts   setfiletype typescript
if has('termguicolors')
  set termguicolors
endif
"for gruvbox material 
"	let g:gruvbox_material_transparent_background=1
"	set background=dark
"     let g:gruvbox_material_background = 'hard'
"     let g:gruvbox_material_better_performance = 1
"     let g:grubbox_material_enable_bold = 1
"	 let g:lightline = {'colorscheme' : 'gruvbox_material'}
"     colorscheme gruvbox-material


"for onedark
"lua << EOF
"require('onedark').setup  {
"    -- Main options --
"    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
"    transparent = true,  -- Show/hide background
"    term_colors = true, -- Change terminal color as per the selected theme style
"    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
"    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
"
"    -- toggle theme style ---
"    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
"    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
"
"    -- Change code style ---
"    -- Options are italic, bold, underline, none
"    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
"    code_style = {
"        comments = 'italic',
"        keywords = 'none',
"        functions = 'none',
"        strings = 'none',
"        variables = 'none'
"    },
"
"    -- Custom Highlights --
"    colors = {
"		bg_blue = "#196fb5"
"		   }, -- Override default colors
"    highlights = {}, -- Override highlight groups
"
"    -- Plugins Config --
"    diagnostics = {
"        darker = true, -- darker colors for diagnostic
"        undercurl = true,   -- use undercurl instead of underline for diagnostics
"        background = true,    -- use background color for virtual text
"    },
"}
"EOF
"colorscheme onedark

" for gruvbox
"	  set background=dark
"	   let g:gruvbox_contrast_dark = 'hard'
"	   let g:gruvbox_invert_selection=0
"	   colorscheme gruvbox
"
" for kanagawa
"lua << EOF
"require('kanagawa').setup({
"    undercurl = true,           -- enable undercurls
"    commentStyle = { italic = true },
"    functionStyle = {},
"    keywordStyle = { italic = true},
"    statementStyle = { bold = true },
"    typeStyle = {},
"    variablebuiltinStyle = { italic = true},
"    specialReturn = true,       -- special highlight for the return keyword
"    specialException = true,    -- special highlight for exception handling keywords
"    transparent = true,        -- do not set background color
"    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
"    globalStatus = false,       -- adjust window separators highlight for laststatus=3
"    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
"    colors = {},
"    overrides = {},
"    theme = "default"           -- Load "default" theme or the experimental "light" theme
"})
"EOF
"colorscheme kanagawa
"
"for tokyonight
lua << EOF
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
EOF
  set background=dark
  let g:tokyonight_transparent_sidebar=1
  colorscheme tokyonight-night

"sonokai
" let g:sonokai_style = 'default'
"        let g:sonokai_better_performance = 1
"		let g:sonokai_transparent_background=2
"		let g:sonokai_enable_italic=1
"        colorscheme sonokai
" let g:lightline = {'colorscheme' : 'sonokai'}

"transparency
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

 lua << END
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set relativenumber
set autoindent
set backspace=indent,eol,start
set smartindent
set noswapfile
set cursorline
" nnoremap <C-p> :GFiles<Cr>
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit = 'v'

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

"coc stuff
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

set mouse=a
set so=999
set ignorecase
set tabstop=4 softtabstop=4
set noerrorbells
set shiftwidth=4
set nowrap
set colorcolumn=80
set signcolumn=yes
set smartcase
set incsearch
set number
set hidden
set nohlsearch
set clipboard=unnamed
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
"  nmap <silent> <leader>j :wincmd s \| :term<CR> 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
set cmdheight=2
set laststatus=2
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
