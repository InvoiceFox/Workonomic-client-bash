
function! s:workonomic_msg(msg)
    let s:cmd = 'echo "hi"'
    let s:cmd = 'curl -s -k -u `cat ~/.config/workonomic/.apitoken`:x -d "msg='.a:msg.'" "http://workonomic.cc/APIBOT"'
    let res = system(s:cmd)
    return res
endfunction

function! s:workonomic_command(option)
  if strlen(a:option)
    echo s:workonomic_msg(a:option)
  endif
endfunction

command! -nargs=? WRK :call <SID>workonomic_command(<q-args>)