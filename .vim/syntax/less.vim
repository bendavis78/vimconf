if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn match lessCombinator "&"

syn match lessComment "//.*$" contains=@Spell
syn match lessVariable "@[A-Za-z_-][A-Za-z0-9_-]*" contained
syn region lessVariableDefinition start="^@" end=";" contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssDefinition,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction
syn match lessMixinCall /\.[A-Za-z][A-Za-z0-9_-]\+;/me=e-1

syn clear cssTagName
syn match cssTagName /\s\{-}\(body\|font\|abbr\|acronym\|address\|applet\|area\|a\|b\|base\|basefont\|bdo\|big\|blockquote\|body\|br\|button\|caption\|center\|cite\|code\|col\|colgroup\|dd\|del\|dfn\|dir\|div\|dl\|dt\|em\|fieldset\|font\|form\|frame\|frameset\|h1\|h2\|h3\|h4\|h5\|h6\|head\|hr\|html\|img\|i\|iframe\|img\|input\|ins\|isindex\|kbd\|label\|legend\|li\|link\|map\|menu\|meta\|noframes\|noscript\|ol\|optgroup\|option\|p\|param\|pre\|q\|s\|samp\|script\|select\|small\|span\|strike\|strong\|style\|sub\|sup\|tbody\|td\|textarea\|tfoot\|th\|thead\|title\|tr\|tt\|ul\|u\|var\|\<table\>\|\*\)\(\s\|[:#.,{]\)/me=e-1

" captures both the definition and the call
syn region lessFunction matchgroup=lessFuncDef start="@[A-Za-z_-][A-Za-z0-9_-]*(" end=")" contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssDefinition,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction

syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssDefinition,cssPseudoClass,css.*Attr,css.*Prop,css,cssComment,cssValue.*,cssColor,cssURL,cssImport,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction,lessCombinator,cssImportant,lessMixinCall,cssBoxProp

hi link lessComment Comment
hi link lessVariable Special
hi link lessFuncDef Function
hi link lessCombinator Function
hi link lessMixinCall Function

let b:current_syntax = "less"
