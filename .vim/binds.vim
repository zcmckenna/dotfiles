noremap <Leader>p /<C-r>"<CR>
nnoremap :com :Tab /\/\/
nnoremap <Leader>c :Tab /\/\/
xnoremap <Leader>c :Tab/\/\/
xnoremap <Leader>$ :s/$/

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n','g')
    let @s = temp
endfunction
