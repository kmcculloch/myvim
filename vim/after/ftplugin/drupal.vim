" Override buffer options from Drupal vimrc plugin.
setlocal nosmartindent

" Override for compound filetypes.
let opt_filetype = &filetype
if opt_filetype == "php.symfony.drupal"
  setlocal tabstop=4
  setlocal shiftwidth=4
  let b:syntastic_php_phpcs_args='--standard=Symfony2'
elseif opt_filetype == "php.spec.drupal"
  setlocal tabstop=4
  setlocal shiftwidth=4
  let b:syntastic_php_phpcs_args='--standard=PHPSpec'
endif

