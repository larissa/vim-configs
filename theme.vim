" ===============================================================
" =====                        THEME                        =====
" ===============================================================

" theme
set termguicolors
let base16colorspace=256
colorscheme base16-paraiso
let g:airline_theme="base16_paraiso"

function! ToggleTheme()
  if g:colors_name == 'base16-paraiso'
    colorscheme base16-atelier-sulphurpool-light
    exec "AirlineTheme papercolor"
  else
    colorscheme base16-paraiso
    exec "AirlineTheme base16_paraiso"
  endif
endfunction
