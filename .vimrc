syntax on
set nu
set laststatus=2
hi StatusLine ctermbg=00 ctermfg=45
set statusline=
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %y
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

