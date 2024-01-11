" Vim syntax file
" Language:	Molecule

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

syn keyword moleculeTodo contained TODO FIXME XXX
syn cluster moleculeCommentGrp contains=moleculeTodo

syn keyword moleculeInclude import

syn keyword moleculeType byte
syn keyword moleculeStructure struct table array vector union option nextgroup=moleculeIdentifier skipwhite skipempty

syn match   moleculeIdentifier "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match   moleculeField "^\s*\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\s*:"he=e-1 skipwhite display nextgroup=moleculeType,moleculeIdentifier

syn region  moleculeArray transparent start="<" end=">" contains=moleculeIdentifier
syn region  moleculeOption transparent start="(" end=")" contains=moleculeIdentifier
syn region  moleculeOption transparent start="\[" end="\]" contains=moleculeIdentifier,moleculeInt

syn match   moleculeInt /-\?\<\d\+\>/ display

syn region  moleculeComment start="\/\*" end="\*\/" contains=@moleculeCommentGrp,@Spell
syn region  moleculeComment start="//" skip="\\$" end="$" keepend display contains=@moleculeCommentGrp,@Spell
syn region  moleculeString  start=/"/ skip=/\\./ end=/"/

hi def link moleculeStructure  Keyword
hi def link moleculeTodo       Todo
hi def link moleculeInclude    Include
hi def link moleculeType       Type
hi def link moleculeIdentifier Identifier
hi def link moleculeField      Label

hi def link moleculeInt        Number
hi def link moleculeComment    Comment
hi def link moleculeString     String

let b:current_syntax = "mol"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
