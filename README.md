# dotfiles
These are some of the configurations I use that I have put together. So far I have cleaned up my vim config, so that is the only thing here atm. But I will soon update on tmux, git and other configs.

*Warning!* The configuration file is heavily commented and not very pleasing to the eye but I figured this would be important for any new vim users looking for configs so they can choose what they like out of it easily. 

## Workflow view
![vim](https://user-images.githubusercontent.com/6232733/46383016-2d1e3980-c67c-11e8-9170-20164763ce09.gif)


### How to use this for your vim config:
- First test it out by cloning and running a file using this config by doing `vim -u test_vimrc`
- Make a copy of your current .vimrc
- Run `cp .vimrc ~/.vimrc` 

Change your iterm2 settings as follows
- Change your iterm2 theme to solarized dark https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
- Use the `11pt Inconsolata-g for Powerline font`. Get it from here: https://github.com/powerline/fonts
- Change your cursor to a box with blinking on.
- Set these:

![iterm](https://user-images.githubusercontent.com/6232733/34429739-328d20e8-ec2a-11e7-8f1d-d13926a9c667.png)
![image](https://user-images.githubusercontent.com/6232733/34429741-3be41e8a-ec2a-11e7-8743-33b35659d2de.png)

- I also usually like to set a global hotkey for iterm2 mapped to (CMD+SHIFT+I)

--------------------------------------------------------------------------------------------------
Here I will note down some small maybe obscure VIMtips I have come across that have helped me at some point or the other. Will update with time.

- Vim allows you to do  `vim -u test_vimrc`. This allows you to run vim with said vimrc in the arguments. 
  allowing you to quickly and nicely try out different vim settings. 
- `"+yy` yank a line to system clipboard, `+p` to paste.
- Copy pasting from system clipboard will not work if `echo has('clipboard') returns 0` you need to install vim and compile it with `+clipboard` feature.
- `Ctrl-k` in insert mode to insert digraphs. To find a list of digraphs do `:digraphs` in normal mode
- `Ctrl-V` in insert mode followed by u to type four hexadecimal digits and get Unicode chars &#F4A9
- Vim spellang: do `:setlocal spell` to switch on spell check, it will highlight all incorrectly spelled words. Go under a word and do `z=` to see suggested words.
  `]s` to move to next misspelled word after cursor.  
  
  ### Credits
  Credits for a lot of the configs go to the incredible open source community vim has &#10084; 	&#10084;
