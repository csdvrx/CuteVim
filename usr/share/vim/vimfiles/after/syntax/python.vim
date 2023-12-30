" a valid comment in italics
"" another valid comment
  " also a valid comment
   syn match Comment '^\s*\#\s\+.*$'
   hi Comment term=NONE,italic cterm=NONE,italic gui=NONE,italic

"# a valid comment adding bold to italics for emphasis
"" ## another valid comment with emphasis
 ""  ###### also a valid comment with emphasis
   syn match BoldComment '^\s*##\+.*$'
   hi BoldComment term=bold,italic cterm=bold,italic gui=bold,italic

"_ for comment titles with underline added for emphasis
""_ another comment title with emphasis
 "" __ also a valid comment title with emphasis
   syn match UnderlineComment '^\s*\#\s*_.*$'
   hi UnderlineComment term=NONE,italic,underline cterm=NONE,italic,underline gui=NONE,italic,underline

"#_ a valid comment adding bold + underline to italics for titles
"" ## __ another valid comment title
 "" __ ## another valid comment title
   syn match BoldUnderlineComment '^\s*##\+\s*_\+.*$'
   hi BoldUnderlineComment term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
