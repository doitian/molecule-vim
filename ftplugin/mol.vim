" Vim filetype plugin file.
" Language:		Molecule

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal comments=://
setlocal commentstring=//\ %s
setlocal formatoptions-=t formatoptions+=croql
setlocal includeexpr=tr(v:fname,'.','/')
setlocal suffixesadd=.mol

let b:undo_ftplugin = "setlocal cms< com< fo< inex< sua<"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8 noet:
