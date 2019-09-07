if filereadable(expand("~/.gvimrc.before"))
  source ~/.gvimrc.before
endif

" CtrlP OS-X Menu remapping
if janus#is_plugin_enabled('ctrlp') && has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif

" colorscheme base16-classic-dark
" set background=dark
set background=light
colorscheme solarized

behave mswin


" colorscheme Tomorrow-Night-Eighties
set transparency=0
set guifont=Menlo:h16
autocmd vimenter * NERDTree

set lines=999 columns=9999

let g:NERDTreeWinSize = 31

" behave mswincall 
" disable_plugin('vim-trailing-whitespace')


map <C-n> :NERDTreeToggle<CR>
" set formatoptions-=ro
set fo-=r fo -=o



function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
