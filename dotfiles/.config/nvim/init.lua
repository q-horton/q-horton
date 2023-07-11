-- COLOUR / THEME
vim.opt.background	= "dark"
vim.opt.termguicolors	= true
vim.cmd("colorscheme codedark")
-- HIGHLIGHTING AND SYNTAX
vim.opt.syntax		= "on"
vim.opt.showmatch	= true
-- INDENTATION
vim.opt.tabstop		= 8
vim.opt.softtabstop	= 4
vim.opt.autoindent	= true
vim.opt.shiftwidth	= 4
vim.opt.filetype.indent	= "on"
-- MISCELLANEOUS
vim.opt.number		= true
vim.opt.wildmenu	= true
vim.opt.mouse		= "a"
vim.opt.ruler		= true
vim.opt.cursorline	= true
vim.opt.backspace	= "indent,eol,start"
vim.opt.scrolloff	= 8
vim.opt.omnifunc	= "syntaxcomplete#Complete"

-- EXTERNAL FILES
require("core.plugins")
require("core.plugin-config")
