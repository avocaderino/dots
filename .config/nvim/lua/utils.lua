local utils = {}

utils.icons = {
  awk             = '',
  bash            = '',
  bib             = '',
  bzl             = '', --
  c               = '',
  checkhealth     = '',
  clojure         = '',
  cmake           = '', --
  cobol           = '', --
  conf            = '',
  cpp             = '',
  csh             = '',
  cs              = '', --
  css             = '',
  d               = '',
  dart            = '',
  db              = '',
  diff            = '',
  dockerfile      = '', --
  elm             = '',
  erlang          = '',
  fish            = '',
  fortran         = 'F',
  fsharp          = '',
  git             = '',
  gitcommit       = '',
  go              = '',
  haskell         = '',
  html            = '',
  java            = '',
  javascript      = '',
  json            = '',
  julia           = '',
  kotlin          = '', --
  ksh             = '',
  less            = '',
  lhaskell        = '',
  lisp            = 'λ',
  lua             = '',
  markdown        = '',
  matlab          = '', --
  meson           = '', --
  netrw           = '',
  nginx           = '',
  nix             = '',
  ocaml           = '', --
  packer          = '',
  perl            = '',
  php             = '',
  plaintex        = '',
  postscr         = '',
  prolog          = '',
  ps1             = '',
  puppet          = '',
  python          = '',
  javascriptreact = '',
  rmd             = '',
  ruby            = '',
  rust            = '',
  sass            = '',
  scala           = '',
  scheme          = 'λ',
  scss            = '',
  sh              = '',
  sql             = '',
  svg             = '',
  swift           = '',
  tex             = '',
  text            = '',
  twig            = '',
  typescript      = '',
  vim             = '',
  vue             = '﵂',
  xml             = '',
  yaml            = '',
  zsh             = '',
}

utils.lookup = function(filetype)
  local icon = utils.icons[filetype]
  if not icon then
    icon = '' -- default
  end

  return icon
end

return utils
