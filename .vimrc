" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
 "Enable snipMate compatibility feature.
"
  " neocomplcache
function! s:WithoutBundles()
 " colorscheme hybrid
  " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
    " 読み込むプラグインの指定

    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'scrooloose/nerdtree' 
    " NeoBundle 'davidhalter/jedi-vim'
    NeoBundle "neocomplete.vim"
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'mattn/emmet-vim'
	NeoBundle 'nanotech/jellybeans.vim'
	NeoBundle 'scrooloose/syntastic'
    NeoBundle 'ctrlpvim/ctrlp.vim'
    NeoBundle 'slim-template/vim-slim'
    NeoBundle 'vobornik/vim-mql4.git'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'szw/vim-tags'
    
    ""for ruby
    NeoBundle 'alpaca-tc/alpaca_tags'
    NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
    NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}
    
	call neobundle#end()
  syntax enable
  " ...
  " 読み込んだプラグインの設定
  " ... 
  "-------キー設定-------
  colorscheme jellybeans
  set fileencodings=utf-8,ucs2le,ucs-2,cp932,euc-jp
  set showmatch
  set expandtab "
  set expandtab "タブ入力を複数の空白入力に置き換える
  set tabstop=2 "画面上でタブ文字が占める幅
  set shiftwidth=2 "自動インデントでずれる幅
  set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
  set autoindent "改行時に前の行のインデントを継続する
  set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
  set ruler
  set backspace=indent,eol,start
  set virtualedit+=block
  set nowrapscan
  set runtimepath+=expand('~/.vim/vim-mql4')
  " ビジュアルモードでのヤンク後にカーソルを選択前の位置に戻さない
  vnoremap y y`>
  nnoremap <C-]> g<C-]>
  nnoremap <silent><C-e> :NERDTree<CR>
  inoremap <silent> jj <ESC>
  autocmd QuickFixCmdPost *grep* cwindow
  ""autocmd QuickfixCmdPost grep copen
  
  nnoremap <silent> <Space>cr :CtrlPMRUFiles<CR>
  
  set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 
   " Disable AutoComplPop.
  set backspace=indent,eol,start
  set fenc=utf-8 ff=unix
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=1
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['php'], 'passive_filetypes': [] }
  ""let g:syntastic_mode_map = { 'mode': 'passive',
  ""          \ 'active_filetypes': ['ruby'] }
  ""let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_php_checkers=['php']
  let g:syntastic_quite_warnings=0

  "矢印キーでは表示行単位で行移動する
  set ruler
  set number
  
  let g:vim_tags_project_tags_command = '/usr/local/bin/ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R . 2>/dev/null'
  let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
  let g:vim_tags_auto_generate = 1
  set tags+=tags,Gemfile.lock.tags

  "ctrlp setting
  let g:ctrlp_max_files  = 200000
  let g:ctrlp_max_depth = 10
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'

  "CoffeeScript
  au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  " インデント設定
  autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
  " オートコンパイル
  "保存と同時にコンパイルする
  ""autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
  ""autocmd QuickFixCmdPost * nested cwindow | redraw! 
  " Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
  ""nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

  " ファイル全般に設定
  augroup General
    autocmd!
    " 設定の保存と復元
    autocmd BufWinLeave * silent mkview
    autocmd BufWinEnter * silent loadview
  augroup END
  
  "endwise"
  let g:endwise_no_mappings=1

  "rails"
  let g:rails_default_file='config/database.yml'
  let g:rails_level = 4
  let g:rails_mappings=1
  let g:rails_modelines=0
  " let g:rails_some_option = 1
  " let g:rails_statusline = 1
  " let g:rails_subversion=0
  " let g:rails_syntax = 1
  " let g:rails_url='http://localhost:3000'
  " let g:rails_ctags_arguments='--languages=-javascript'
  " let g:rails_ctags_arguments = ''
  function! SetUpRailsSetting()
      nnoremap <buffer><Space>r :R<CR>
      nnoremap <buffer><Space>a :A<CR>
      nnoremap <buffer><Space>m :Rmodel<Space>
      nnoremap <buffer><Space>c :Rcontroller<Space>
      nnoremap <buffer><Space>v :Rview<Space>
      nnoremap <buffer><Space>p :Rpreview<CR>
  endfunction

  aug MyAutoCmd
      au User Rails call SetUpRailsSetting()
  aug END

  aug RailsDictSetting
      au!
  aug END
  

  " Enable heavy features.
  " Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  " Use underbar completion.
  "let g:neocomplcache_enable_underbar_completion = 1
  "
  " Define dictionary.
  " complcache_dictionary_filetype_lists
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : \<Space>"

 " let g:neocomplcache_enable_camel_case_completion = 1
 " let g:neocomplcache_enable_underbar_completion = 1
"f let g:neocomplcache_smart_case = 1
 " let g:neocomplcache_min_syntax_length = 3
 " let g:neocomplcache_manual_completion_start_length = 0
 " let g:neocomplcache_caching_percent_in_statusline = 1
 " let g:neocomplcache_enable_skip_completion = 1
 " let g:neocomplcache_skip_input_time = '0.5'
 "
 " 
 "" inoremap { {}<LEFT>
 "" inoremap < <><LEFT>
 """" inoremap % % %<LEFT>
 ""  inoremap [ []<LEFT>
 "" inoremap ( ()<LEFT>
  inoremap {<Enter> {}<Left><CR><ESC><S-o>
  inoremap [<Enter> []<Left><CR><ESC><S-o>
  inoremap (<Enter> ()<Left><CR><ESC><S-o>
  inoremap " ""<LEFT>
  inoremap ' ''<LEFT>
  vnoremap { "zdi^V{<C-R>z}<ESC>
  vnoremap [ "zdi^V[<C-R>z]<ESC>
  vnoremap ( "zdi^V(<C-R>z)<ESC6
  vnoremap " "zdi^V"<C-R>z^V"<ESC>
  vnoremap ' "zdi'<C-R>z'<ESC>

  "空行のインデントを勝手に消さない
  nnoremap o oX<C-h>
  nnoremap O OX<C-h>
  inoremap <CR> <CR>X<C-h>

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
endfunction


" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry 
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()
