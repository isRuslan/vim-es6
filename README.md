![](http://i.imgur.com/lYbyBTe.png)

> Write JavaScript ES6 easily with vim.

![](https://giant.gfycat.com/FluidFrailAmethystgemclam.gif)

## Install

> You need [SnipMate](https://github.com/garbas/vim-snipmate) or [UltiSnips](https://github.com/SirVer/ultisnips) installed.

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
| `gfn→`   | `function* name (arg) { yield arg; }` |
| `=>→`    | `(arg) => { ... },` |
| `class→` | `class name { constructor () { ...} }` |
| `forof→` | `for (let value of arr) { ... }` |
| `im→`    | `import lib from 'Library'` |
| `ex→`    | `export default foo` |
