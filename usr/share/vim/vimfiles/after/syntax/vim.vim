" a valid comment in italics
"" another valid comment
  " also a valid comment
   syn match Comment '^\s*".*$'
   hi Comment term=NONE,italic cterm=NONE,italic gui=NONE,italic

"# a valid comment adding bold to italics for emphasis
"" ## another valid comment with emphasis
 ""  ###### also a valid comment with emphasis
   syn match BoldComment '^\s*"\+\s*\#.*$'
   hi BoldComment term=bold,italic cterm=bold,italic gui=bold,italic

"# not a valid comment if the double quote is removed so use bold and red instead of italics
   syn match InvalidComment '^#.*$'
   hi InvalidComment term=bold cterm=bold gui=bold ctermfg=red guifg=red

"_ for comment titles with underline added for emphasis
""_ another comment title with emphasis
 "" __ also a valid comment title with emphasis
   syn match UnderlineComment '^\s*"\+\s*_.*$'
   hi UnderlineComment term=NONE,italic,underline cterm=NONE,italic,underline gui=NONE,italic,underline

"#_ a valid comment adding bold + underline to italics for titles
"" ## __ another valid comment title
 "" __ ## another valid comment title
   syn match BoldUnderlineComment '^\s*"\+\s*\#\+\s*_\+.*$'
   syn match UnderlineBoldComment '^\s*"\+\s*_\+\s*\#\+.*$'
   hi link BoldUnderlineComment UnderlineBoldComment
   hi UnderlineBoldComment term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
