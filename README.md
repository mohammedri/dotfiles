Few interesting things:
- Vim allows you to do  `vim -u test_vimrc`. This allows you to run vim with said vimrc in the arguments. 
  allowing you to quickly and nicely try out different vim settings. 
- `"+yy` yank a line to system clipboard, `+p` to paste.
- Copy pasting from system clipboard will not work if `echo has('clipboard') returns 0` you need to install vim and compile it with `+clipboard` feature.
- `Ctrl-k` in insert mode to insert digraphs. To find a list of digraphs do `:digraphs` in normal mode
- `Ctrl-V` in insert mode followed by u to type four hexadecimal digits and get Unicode chars &#F4A9
- Vim spellang: do `:setlocal spell` to switch on spell check, it will highlight all incorrectly spelled words. Go under a word and do `z=` to see suggested words.
  `]s` to move to next misspelled word after cursor.  
