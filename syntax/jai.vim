if exists("b:current_syntax")
  finish
endif

" Fixes long block comments highlighting.
syntax sync minlines=9999

syntax keyword jaiUsing using
syntax keyword jaiDelete delete
syntax keyword jaiCast cast

syntax keyword jaiStruct struct
syntax keyword jaiEnum enum
syntax keyword jaiEnumFlags enum_flags
syntax keyword jaiUnion union

syntax keyword jaiIf if
syntax keyword jaiIfx ifx
syntax keyword jaiCase case
syntax keyword jaiThen then
syntax keyword jaiElse else
syntax keyword jaiFor for
syntax keyword jaiWhile while

syntax keyword jaiBreak break
syntax keyword jaiContinue continue
syntax keyword jaiRemove remove

syntax keyword jaiDataType void string int float f32 f64 float32 float64 u8 u16 u32 u64 s8 s16 s32 s64 i8 i16 i32 i64 bool
syntax keyword jaiBool true false
syntax keyword jaiNull null

syntax keyword jaiReturn return
syntax keyword jaiDefer defer

syntax keyword jaiInline inline
syntax keyword jaiNoInline no_inline

syntax keyword jaiIt it
syntax keyword jaiItIndex it_index
syntax keyword jaiContext context

syntax match jaiMacro "#\<\w\+\>" display

syntax match jaiStringTemplate "\v(\\)?\%(\d)?" contained

syntax region jaiString start=/\v"/ skip=/\v\\./ end=/\v"/ keepend contains=jaiStringTemplate

" These must go after jaiMacro
" A special rule to match `#string`
syntax match jaiStringDirective "#string\>" contained
syntax region jaiHereString start=/\v#string\s+\z(<\w+>)/ end=/\v<\z1>/ keepend contains=jaiStringDirective,jaiStringTemplate

syntax keyword jaiAutoCast xx

syntax match jaiFunction "\v<\w*>(\s*::\s*)@="

syntax match jaiTagNote "@\<\w\+\>" display

syntax match jaiClass "\v<[A-Z]\w+>" display
syntax match jaiConstant "\v<[A-Z_][A-Z0-9_]+>" display

syntax match jaiInteger "\<[0-9_]\+\>" display
syntax match jaiFloat "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=" display
syntax match jaiHex "\<0x[0-9A-Fa-f_]\+\>" display
syntax match jaiBin "\<0b[01_]\+\>" display

syntax match jaiAutoBake "$\<\w\+\>"
syntax match jaiOptionalAutoBake "$$\<\w\+\>"

syntax match jaiCommentNote "@\<\w\+\>" contained display
syntax keyword jaiCommentTODO contained TODO FIXME XXX
syntax match jaiLineComment "//.*" contains=jaiCommentNote,jaiCommentTODO
syntax region jaiBlockComment start=/\v\/\*/ end=/\v\*\// contains=jaiCommentNote,jaiCommentTODO,jaiBlockComment

highlight def link jaiIt Keyword
highlight def link jaiItIndex Keyword
highlight def link jaiContext Keyword
highlight def link jaiUsing Keyword
highlight def link jaiCast Keyword
highlight def link jaiAutoCast Keyword
highlight def link jaiDelete Keyword
highlight def link jaiReturn Keyword
highlight def link jaiDefer Keyword

highlight def link jaiInline Keyword
highlight def link jaiNoInline Keyword

highlight def link jaiBreak Keyword
highlight def link jaiContinue Keyword
highlight def link jaiRemove Keyword

highlight def link jaiString String
highlight def link jaiHereString String
highlight def link jaiStringTemplate Special

highlight def link jaiStruct Structure
highlight def link jaiEnum Structure
highlight def link jaiEnumFlags Structure
highlight def link jaiUnion Structure

highlight def link jaiFunction Function

highlight def link jaiMacro Macro
highlight def link jaiStringDirective Macro
highlight def link jaiIf Conditional
highlight def link jaiIfx Conditional
highlight def link jaiCase Conditional
highlight def link jaiThen Conditional
highlight def link jaiElse Conditional
highlight def link jaiFor Repeat
highlight def link jaiWhile Repeat

highlight def link jaiLineComment Comment
highlight def link jaiBlockComment Comment
highlight def link jaiCommentNote Todo

highlight def link jaiClass Type

highlight def link jaiAutoBake Constant
highlight def link jaiOptionalAutoBake Constant

highlight def link jaiTagNote Identifier
highlight def link jaiDataType Type
highlight def link jaiBool Boolean
highlight def link jaiConstant Constant
highlight def link jaiNull Type
highlight def link jaiInteger Number
highlight def link jaiFloat Float
highlight def link jaiHex Number
highlight def link jaiBin Number

let b:current_syntax = "jai"
