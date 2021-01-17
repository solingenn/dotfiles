unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
set background=dark
set t_Co=256
set showmode
set number

"====================================================================
" KEYMAPS
"====================================================================
" toggle display line numbers
nmap <F3> :set invnumber<CR>

" copy selected lines to system clipboard
vmap <C-y> :w !xclip -i -selection clipboard<CR><CR>

"====================================================================
" CURSOR SETTINGS
"====================================================================
" vim cursor escape codes for the terminal emulator
" INSERT (&t_SI)  - vertical bar (I-beam)
" REPLACE (&t_SR) - underscore
" VISUAL (&t_EI)  - block
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" set cursor to vertical bar when entering cmd line and
" revert cursor back to block when leaving cmd line
autocmd CmdlineEnter * execute 'silent !echo -ne "' . &t_SI . '"'
autocmd CmdlineLeave * execute 'silent !echo -ne "' . &t_EI . '"'

" set cursor to vertical bar on VimLeave
autocmd VimLeave * execute '!echo -ne "' . &t_SI . '"'
"====================================================================:
