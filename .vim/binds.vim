noremap <Leader>p /<C-r>"<CR>
nnoremap :com :Tab /\/\/
nnoremap <Leader>c :Tab /\/\/
xnoremap <Leader>c :Tab/\/\/
xnoremap <Leader>$ :s/$/

map <Leader>w :set wrap!<CR>
map <Leader>h :noh<CR>

command -nargs=? -complete=file NT NERDTree <args>
command Findmods /^\s*\w\+\_s\+\(\(\w\+\_s*(\)\|\(\#\_s*(\(\_s*\.\w\+\_s*(\w\+),\=\)\+\_s*)\_s*\w\+\)\)

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

tnoremap <Esc> <C-\><C-n> " Change to normal mode with escape in terminals

map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

nnoremap gU :call FloatUp()<CR>

nmap <S-F12> :call FontSizeMinus()<CR>
nmap <F12> :call FontSizePlus()<CR>

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

nnoremap <silent> <C-F> :Files<CR>
