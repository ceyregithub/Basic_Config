" Maintainer:	Clifton Eyre
" Last Change:	September 28, 2014

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "RightSize"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#303030 ctermbg=236
  hi CursorColumn guibg=#303030 ctermbg=236
  hi ColorColumn ctermbg=233 guibg=#303030
  hi MatchParen guifg=#c0c0c0 ctermfg=7 guibg=#767676 ctermbg=243 gui=bold
  hi Pmenu 		guifg=#c0c0c0 ctermfg=7 guibg=#444444 ctermbg=238
  hi PmenuSel 	guifg=#000000 ctermfg=0 guibg=#dfdf87 ctermbg=186
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#606060 ctermbg=241 gui=none
hi Normal 		guifg=#a8a8a8 gui=none
hi NonText 		guifg=#808080 ctermfg=244 gui=none
hi LineNr 		guifg=#808080 ctermfg=244 guibg=#262626 ctermbg=235 gui=none
hi StatusLine 	guifg=#c0c0c0 ctermfg=7 guibg=#444444 ctermbg=238 gui=italic
hi StatusLineNC guifg=#767676 ctermfg=243 guibg=#444444 ctermbg=238 gui=none
hi VertSplit 	guifg=#444444 ctermfg=238 guibg=#444444 ctermbg=238 gui=none
hi Folded 		guibg=#444444 ctermbg=238 guifg=#a0a8b0 ctermfg=248 gui=none
hi Title		guifg=#c0c0c0 ctermfg=7 guibg=NONE	gui=bold
hi Visual		guifg=#c0c0c0 ctermfg=7 guibg=#444444 ctermbg=238 gui=none
hi SpecialKey	guifg=#808080 ctermfg=244 guibg=#303030 ctermbg=236 gui=none
hi WarningMsg   guifg=#df0000 ctermfg=160 gui=none

" Syntax highlighting
hi Comment 		guifg=#585858 ctermfg=240 gui=italic
hi Todo 		guifg=#8a8a8a ctermfg=245 gui=italic
hi Constant 	guifg=#ff00df ctermfg=200 gui=none
hi String 		guifg=#87af00 ctermfg=106 gui=italic
hi Identifier 	guifg=#dfdf87 ctermfg=186 gui=none
hi Function 	guifg=#df8700 ctermfg=172 gui=none
hi Type 		guifg=#5fdf5f ctermfg=77 gui=none
hi Statement 	guifg=#87afff ctermfg=111 gui=none
hi Keyword		guifg=#5fafff ctermfg=75 gui=none
hi PreProc 		guifg=#df875f ctermfg=173 gui=none
hi Number		guifg=#0087ff ctermfg=33 gui=none
hi Special		guifg=#dfffdf ctermfg=194 gui=none
hi Error		guifg=#df0000 ctermfg=160 gui=none
hi SpecialChar		guifg=#dfffdf ctermfg=194 gui=none
hi PreCondit		guifg=#af5fff ctermfg=135 gui=none
hi Macro		guifg=#005f87 ctermfg=24 gui=none
hi Include		guifg=#5fafff ctermfg=75 gui=none
hi StorageClass		guifg=#afff00 ctermfg=154 gui=none
hi Structure		guifg=#ffaf00 ctermfg=214 gui=none
hi Operator		guifg=#ffdf00 ctermfg=220 gui=none
hi Float		guifg=#df875f ctermfg=173 gui=none
hi Character		guifg=#5f87ff ctermfg=69 gui=none
hi Repeat		guifg=#ffdf5f ctermfg=221 gui=none
hi Conditional		guifg=#ff5f87 ctermfg=204 gui=none
hi Label		guifg=#af00df ctermfg=128 gui=none

hi NeomakeErrorSign cterm=none ctermbg=none ctermfg=red
hi NeomakeWarningSign cterm=none ctermbg=none ctermfg=yellow
hi SignColumn cterm=none ctermbg=none ctermfg=white
