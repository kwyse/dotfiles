function Ranger()
  let tmp = tempname()
  exec 'terminal ranger --choosefiles=' . shellescape(tmp)

  if !filereadable(tmp)
    return
  endif

  let file_names = readfile(tmp)
  if empty(file_names)
    return
  endif

  exec 'edit ' . fnameescape(file_names[0])
  redraw!
endfunction
