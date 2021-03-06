syntax on
set title         " show the name of file in terminal title
set ruler
set ts=2
set ignorecase
set incsearch
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab			" always uses spaces instead of characters
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set background=dark " allows it to show well against dark terminal
colorscheme molokai " simulates the monokai colorscheme in Sublime
autocmd InsertEnter,InsertLeave * set cul! " distinguish between Insert and Visual modes


