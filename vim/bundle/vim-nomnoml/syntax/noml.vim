" Vim syntax file
" Language: Nomnoml
" Maintainer: Rich Kulesus
" Latest Revision: 7 March 2023

if exists("b:current_syntax")
    finish
endif

let b:current_syntax="noml"

hi def link nomlDirs         Comment
hi def link nomlDir          Comment
hi def link nomlNum          PreProc

hi def link nomlObj          Define
hi def link nomlTypes        Type
" hi def link nomlHip          Type
" hi def link nomlString       Constant
" hi def link nomlDesc         PreProc

hi def link testKW           PreProc

"syn keyword testKW jollyness Pirate
syn match testKW '\[.*\]'

syn match nomlDir "#.*$" contains=nomlNum,nomlDirs

syn region nomlObj start='\[' end='\]' transparent contains=nomlTypes

" NOML Directives
syn match nomlNum '[-+]\d\+'
syn match nomlNum '\d\+'
syn match nomlNum '[-+]\d\+\.\d*'
syn match nomlNum '\d\+'
syn keyword nomlDirs arrowSize bendSize direction gutter edgeMargin
syn keyword nomlDirs gravity edges background fill fillArrows
syn keyword nomlDirs font fontSize leading lineWidth padding
syn keyword nomlDirs spacing stroke title zoom acycicler ranker

" NOML Object Types
syn keyword nomlTypes <abstract> <instance> <reference> <package> <frame> <lollipop>
syn keyword nomlTypes <start> <end> <choice>
syn keyword nomlTypes <sync> <input> <sender> <receiver> <transceiver>
syn keyword nomlTypes <actor> <usecase>
syn keyword nomlTypes <note> <label> <hidden> <database> <table>




" Regions
" syn region syntaxElementRegion start='x' end='y'
" syn region directives start='#' end='$' transparent contains=nomlNum
" syn region types start='\[' end='\]' transparent contains=nomlTypes

