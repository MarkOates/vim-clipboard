" Vim global plugin for copying to the MacOS keybaord
" Maintainer:	Mark Oates <github.com/MarkOates>
" License:	This file is placed in the public domain.

if exists("g:loaded_vimclipb")
  finish
endif
let g:loaded_vimclipb = 1


exe ":echo \"Don't forget about vim-clipboard!!\""


function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


if !hasmapto('<Plug>VimclipbCopy')
  map <unique> <Leader>gn <Plug>VimclipbCopy
endif

noremap <unique> <script> <Plug>VimclipbCopy  <SID>Copy

noremap <SID>VimclipbCopy  :call <SID>Copy<CR>

function s:Copy()
  echo "Hello!"
  " getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]
  " echo s:get_visual_selection()
endfunction
