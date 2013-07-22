" berks.vim - basic vim/berks integration
" Maintainer: Mark Cornick <https://github.com/markcornick>

if exists("g:loaded_berks") || v:version < 700 || &cp || !executable('berks')
  finish
endif
let g:loaded_berks = 1

function! s:commands(A, L, P)
  return "apply\nconfigure\ncontingent\ncookbook\nhelp\ninit\ninstall\nlist\noutdated\npackage\nshelf\nshow\nupdate\nupload"
endfunction

augroup berks
  autocmd!
  autocmd VimEnter *
        \ command! -nargs=+ -complete=custom,s:commands Berks execute '!berks '.<q-args>
augroup END

" vim:set et sw=2:
