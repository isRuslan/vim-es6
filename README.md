## vim es6 snippets

> Write JavaScript ES6 easily with vim snippets.

![](https://raw.githubusercontent.com/isRuslan/vim-es6-snippets/master/es6.gif)

## Install

> You need [SnipMate](https://github.com/garbas/vim-snipmate) installed.

To install using [Vundle](https://github.com/gmarik/vundle):

	" add this line to your .vimrc file
	Plugin 'isRuslan/vim-es6-snippets'

To install using pathogen.vim:

	cd ~/.vim/bundle
	git clone https://github.com/isRuslan/vim-es6-snippets.git

To manual install [download](https://github.com/isRuslan/vim-es6-snippets/releases) zip file:

	cd ~/.vim
	unzip vim-es6-snippets.zip


To checkout the source from repository:

	cd ~/.vim/bundle
	git clone https://github.com/isRuslan/vim-es6-snippets.git

## List
| Trigger  | Result  |
| -------: | ------- |
| `gfn→`   | `function* name (arg) { yield arg; },` |
| `=>→`    | `(arg) => { ... },` |
| `class→` | `class name { constructor () { ...} }` |
| `forof→` | `for (let value of arr) { ... }` |
| `im→`    | `import lib from 'Library'` |
