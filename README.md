## vim es6 :dancer:

> Write JavaScript ES6 easily with vim.

![](https://raw.githubusercontent.com/isRuslan/vim-es6/master/sample.gif)

## Install

> You need [SnipMate](https://github.com/garbas/vim-snipmate) installed.

To install using [Vundle](https://github.com/gmarik/vundle):

	" add this line to your .vimrc file
	Plugin 'isRuslan/vim-es6'

To install using pathogen.vim:

	cd ~/.vim/bundle
	git clone https://github.com/isRuslan/vim-es6.git

To manual install [download](https://github.com/isRuslan/vim-es6/releases) zip file:

	cd ~/.vim
	unzip vim-es6.zip


To checkout the source from repository:

	cd ~/.vim/bundle
	git clone https://github.com/isRuslan/vim-es6.git

## Snippets list
| Trigger  | Result  |
| -------: | ------- |
| `gfn→`   | `function* name (arg) { yield arg; },` |
| `=>→`    | `(arg) => { ... },` |
| `class→` | `class name { constructor () { ...} }` |
| `forof→` | `for (let value of arr) { ... }` |
| `im→`    | `import lib from 'Library'` |
