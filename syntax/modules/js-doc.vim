" JSDoc support 
if !exists("javascript_ignore_javaScriptdoc")
	syntax case ignore

	syntax region javaScriptDocComment        matchgroup=javaScriptComment start="/\*\*\s*$"  end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,@javaScriptHtml,jsInJsdocExample,@Spell fold
	syntax match  javaScriptDocTags           contained "@\(param\|argument\|returns\=\|requires\|exception\|throws\|type\|class\|extends\|see\|link\|member\|module\|method\|title\|namespace\|name\|memberof\|exports\|callback\|typedef\|property\|optional\|default\|base\|file\|mixes\|mixin\|alias\|const\|enum\|fires\|event\|readonly\|tutorial\)\>" nextgroup=javaScriptDocParam,javaScriptDocSeeTag skipwhite
	syntax match  javaScriptDocTags           contained "@\(beta\|deprecated\|description\|fileoverview\|author\|license\|version\|constructor\|private\|protected\|final\|ignore\|addon\|exec\)\>"
	syntax match  javaScriptDocParam          contained "\%(#\|\w\|\.\|:\|\/\)\+"
	syntax region javaScriptDocSeeTag         contained matchgroup=javaScriptDocSeeTag start="{" end="}" contains=javaScriptDocTags

	syntax case match
endif
