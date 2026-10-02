" Lightweight fallback while the LikeC4 LSP supplies semantic highlighting.
if exists('b:current_syntax')
    finish
endif

syntax keyword likec4Keyword specification model views deployment global import
syntax keyword likec4Keyword element relationship tag view dynamic include exclude
syntax keyword likec4Keyword extend extends group style where with and or not
syntax keyword likec4Property title description technology metadata link icon color
syntax keyword likec4Property shape notation autoLayout navigateTo source target
syntax keyword likec4Boolean true false
syntax match likec4Number /\<\d\+\(\.\d\+\)\?\>/
syntax match likec4Tag /#[A-Za-z_][A-Za-z0-9_]*/
syntax match likec4Operator /<\?->\?\|=/
syntax match likec4Delimiter /[{}(),:]/
syntax region likec4String start=/"/ skip=/\\./ end=/"/
syntax region likec4String start=/'/ skip=/\\./ end=/'/
syntax region likec4String start=/"""/ end=/"""/ keepend
syntax region likec4String start=/'''/ end=/'''/ keepend
syntax match likec4Comment /\/\/.*/ contains=@Spell
syntax region likec4Comment start=/\/\*/ end=/\*\// contains=@Spell

highlight default link likec4Keyword Keyword
highlight default link likec4Property Identifier
highlight default link likec4Boolean Boolean
highlight default link likec4Number Number
highlight default link likec4Tag Type
highlight default link likec4Operator Operator
highlight default link likec4Delimiter Delimiter
highlight default link likec4String String
highlight default link likec4Comment Comment
let b:current_syntax = 'likec4'
