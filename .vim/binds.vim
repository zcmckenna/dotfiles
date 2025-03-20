noremap <Leader>p /<C-r>"<CR>
nnoremap :com :Tab /\/\/
nnoremap <Leader>c :Tab /\/\/
xnoremap <Leader>c :Tab/\/\/
xnoremap <Leader>$ :s/$/

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

nnoremap gU :call FloatUp()<CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n','g')
    let @s = temp
endfunction

function CleanPaths()
    :v/\[\d.*/d
    :%s/^[^\/]*/
    :%s/ :.*/
    :g/ /s/\/[^\/]*/
    :v/\//d
    :w !sort | uniq -c | sort -nr > %:p:h/unique_paths_%:t
    :tabnew %:p:h/unique_paths_%:t
endfunction

function FloatUp()
    while line(".") > 1
                \ && (strlen(getline(".")) < col(".")
                \ || getline(".")[col(".") - 1] =~ '\s')
        norm k
    endwhile
endfunction
