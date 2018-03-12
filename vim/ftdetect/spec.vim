function CheckForSpec()
  let directory = expand('%:p:h')
  return directory =~ "/spec"
endfunction

autocmd BufRead,BufNewFile *.php if CheckForSpec() | setlocal filetype=php.spec | endif
