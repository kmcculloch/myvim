" Override buffer options from Drupal vimrc plugin.
setlocal nosmartindent

" Override for compound filetypes.
let opt_filetype = &filetype
if opt_filetype == "php.symfony.drupal"
  setlocal tabstop=4
  setlocal shiftwidth=4
  "let b:syntastic_php_phpcs_args='--standard=Symfony2'
elseif opt_filetype == "php.spec.drupal"
  setlocal tabstop=4
  setlocal shiftwidth=4
  "let b:syntastic_php_phpcs_args='--standard=PHPSpec'
endif

" Something is overriding our local .vimrc variables, so redo the source
" command here, at the end of the opening routine, so that they stick.
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc"
if !empty(glob(git_vimrc))
    sandbox exec ":source " . git_vimrc
endif
