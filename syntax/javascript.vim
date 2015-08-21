" Vim syntax file
"      Language: JavaScript
"    Maintainer: Ruslan Ismagilov <https://github.com/isRuslan>
"       Version: 1.0.2
"       Credits: Kao Wei-Ko(othree), Zhao Yi, Claudio Fleiner, Scott Shattuck 
"                (This file is based on their hard work)

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
	unlet javaScript_fold
endif

syntax sync fromstart

"" syntax coloring shebang line
syntax match shebang "^#!.*"
hi link shebang Comment

" Statement Keywords 
syntax keyword javaScriptSource         import export
syntax keyword javaScriptIdentifier     arguments this let const var void yield
syntax keyword javaScriptOperator       delete new instanceof typeof
syntax keyword javaScriptBoolean        true false
syntax keyword javaScriptNull           null undefined
syntax keyword javaScriptMessage        alert confirm prompt
syntax keyword javaScriptDeprecated     escape unescape applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
syntax keyword javaScriptConditional    if else switch
syntax keyword javaScriptRepeat         do while for in
syntax keyword javaScriptBranch         break continue
syntax keyword javaScriptLabel          case default
syntax keyword javaScriptPrototype      prototype
syntax keyword javaScriptStatement      return with
syntax keyword javaScriptGlobalObjects  Array Boolean Date Function Math Number Object RegExp String
syntax keyword javaScriptExceptions     try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
syntax keyword javaScriptReserved       abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public

" Comments 
syntax keyword javaScriptCommentTodo      TODO FIXME XXX TBD contained
syntax match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syntax match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javaScriptComment          start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo

" Strings, Numbers and Regex Highlight 
syntax match   javaScriptSpecial          "\\\d\d\d\|\\."
syntax region  javaScriptString	          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptString	          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc
syntax region  javascriptTemplateInternal  start=/\${/ end=/}/ contains=javaScriptString
syntax region  javascriptTemplate          start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/ contains=javaScriptSpecial,javascriptTemplateInternal nextgroup=@javascriptComments,@javascriptSymbols 
syntax match   javaScriptSpecialCharacter "'\\.'"
syntax match   javaScriptNumber           "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax match   javaScriptFloat            /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax match   javascriptDollar           "\$"

" No need? 
" syntax keyword javaScriptGlobal         self top parent

" Code blocks"
syntax cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptString,javaScriptRegexpString,javascriptTemplate,javaScriptNumber,javaScriptFloat,javascriptDollar,javaScriptLabel,javaScriptSource,javaScriptWebAPI,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFuncKeyword,javaScriptConditional,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptMessage,javaScriptIdentifier,javaScriptExceptions,javaScriptReserved,javaScriptDeprecated,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptBrowserObjects,javaScriptDOMObjects,javaScriptAjaxObjects,javaScriptPropietaryObjects,javaScriptDOMMethods,javaScriptHtmlElemProperties,javaScriptDOMProperties,javaScriptEventListenerKeywords,javaScriptEventListenerMethods,javaScriptAjaxProperties,javaScriptAjaxMethods,javaScriptFuncArg

if main_syntax == "javascript"
	syntax sync clear
	syntax sync ccomment javaScriptComment minlines=200
	" syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif

" Function and arguments highlighting 
syntax keyword javaScriptFuncKeyword     function contained
syntax region  javaScriptFuncExp         start=/\w\+\s\==\s\=function\>/ end="\([^)]*\)" contains=javaScriptFuncEq,javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match   javaScriptFuncArg         "\(([^()]*)\)" contains=javaScriptParens,javaScriptFuncComma contained
syntax match   javaScriptFuncComma       /,/ contained
syntax match   javaScriptFuncEq          /=/ contained
syntax region  javaScriptFuncDef         start="\<function\>" end="\([^)]*\)" contains=javaScriptFuncKeyword,javaScriptFuncArg keepend

" Braces, Parens, symbols, colons 
syntax match javaScriptBraces       "[{}\[\]]"
syntax match javaScriptParens       "[()]"
syntax match javaScriptOpSymbols    "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syntax match javaScriptEndColons    "[;,]"
syntax match javaScriptLogicSymbols "\(&&\)\|\(||\)"

" include syntax modules
runtime syntax/vim-es6/modules/*.vim

" JavaScriptFold Function
function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
endfunction

" Highlight links 
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
	if version < 508
		let did_javascript_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink javaScriptEndColons              Operator
	HiLink javaScriptOpSymbols              Operator
	HiLink javaScriptLogicSymbols           Boolean
	HiLink javaScriptBraces                 Function
	HiLink javaScriptParens                 Operator

	HiLink javaScriptComment                Comment
	HiLink javaScriptLineComment            Comment
	HiLink javaScriptDocComment             Comment
	HiLink javaScriptCommentTodo            Todo

	HiLink javaScriptDocTags                Special
	HiLink javaScriptDocSeeTag              Function
	HiLink javaScriptDocParam               Function

	HiLink javaScriptString                 String
  HiLink javascriptTemplateInternal       Label
  HiLink javascriptTemplate               String
	HiLink javaScriptRegexpString           String

	HiLink javaScriptNumber                 Number
	HiLink javaScriptFloat                  Number

	HiLink javaScriptCharacter              Character
	HiLink javaScriptPrototype              Type
	HiLink javaScriptConditional            Conditional
	HiLink javaScriptBranch                 Conditional
	HiLink javaScriptIdentifier             Identifier
	HiLink javaScriptRepeat                 Repeat
	HiLink javaScriptStatement              Statement
	HiLink javaScriptMessage                Keyword
	HiLink javaScriptReserved               Keyword
	HiLink javaScriptOperator               Operator
	HiLink javaScriptNull                   Type
	HiLink javaScriptBoolean                Boolean
	HiLink javaScriptLabel                  Label
	HiLink javaScriptSpecial                Special
	HiLink javaScriptSource                 Special
	HiLink javaScriptGlobalObjects          Special
	HiLink javaScriptExceptions             Special
  HiLink javascriptDollar                 Special

	HiLink javaScriptDeprecated             Exception
	HiLink javaScriptError                  Error
	HiLink javaScriptParensError            Error
	HiLink javaScriptParensErrA             Error
	HiLink javaScriptParensErrB             Error
	HiLink javaScriptParensErrC             Error
	HiLink javaScriptDomErrNo               Error

	HiLink javaScriptDomNodeConsts          Constant
	HiLink javaScriptDomElemAttrs           Label
	HiLink javaScriptDomElemFuncs           Type

	HiLink javaScriptWebAPI                 Type

	HiLink javaScriptHtmlElemAttrs          Label
	HiLink javaScriptHtmlElemFuncs          Type

	HiLink javaScriptCssStyles              Type

	HiLink javaScriptBrowserObjects         Constant

	HiLink javaScriptDOMObjects             Constant
	HiLink javaScriptDOMMethods             Type
	HiLink javaScriptDOMProperties          Label

	HiLink javaScriptAjaxObjects            Constant
	HiLink javaScriptAjaxMethods            Type
	HiLink javaScriptAjaxProperties         Label

	HiLink javaScriptFuncKeyword            Function
	HiLink javaScriptFuncDef                PreProc
	HiLink javaScriptFuncExp                Title
	HiLink javaScriptFuncArg               	Special
	HiLink javaScriptFuncComma              Operator
	HiLink javaScriptFuncEq                 Operator

	HiLink javaScriptHtmlEvents             Constant
	HiLink javaScriptHtmlElemProperties     Label

	HiLink javaScriptEventListenerKeywords  Type

	HiLink javaScriptPropietaryObjects      Constant

	delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
" syntax clear htmlJavaScript
" syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
	unlet main_syntax
endif
