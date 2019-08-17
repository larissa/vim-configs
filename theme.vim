" ===============================================================
" =====                        THEME                        =====
" ===============================================================

"tell the term has 256 colors
if !has('nvim')
  set t_Co=256
  if has("gui_running")
    set guitablabel=%M%t

    if has("gui_gnome") || has("gui_gtk")
      set term=gnome-256color
      set guifont=DejaVu\ Sans\ Mono\ 10
      set columns=100
      set lines=35
    endif

    if has("gui_win32") || has("gui_win32s")
      set guifont=Consolas:h12
      set enc=utf-8
    endif
  else
    set term=gnome-256color
    "disables Background Color Erase so theme works on tmux -2
    set t_ut=
  endif
endif

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
