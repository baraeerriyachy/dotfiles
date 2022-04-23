syntax on
set nu
set incsearch
set background=dark
highlight LineNr ctermfg=45
set laststatus=2
hi StatusLine ctermbg=00 ctermfg=45
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %y
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ %p%%
