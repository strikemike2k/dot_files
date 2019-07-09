# dot_files
You know, the basic files under `~/` that begin with a `.`

Used to keep my computers and mind in sync.

## Setup
Using Vundle https://github.com/VundleVim/Vundle.vim
```bash
cd ~
git clone https://github.com/strikemike2k/dot_files
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

From your `~/` home directory, symlink the dot_files:
```bash
ln -s dot_files/.bash_profile
ln -s dot_files/.vimrc
ln -s dot_files/.gitconfig
ln -s dot_files/.gitignore_global
ln -s dot_files/.git-prompt.sh
ln -s dot_files/.git-completion.bash
ln -s dot_files/.pryrc
ln -s dot_files/.agignore
ln -s dot_files/.zshrc
```

Set up vim folders:
```bash
mkdir ~/.vim/files && mkdir ~/.vim/files/{backup,info,swap,undo}
```

Install fzf (fuzzy find)
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Install all vim plugins:
```bash
vim +PluginInstall +qall
```

Load your profile settings:
```bash
source ~/.bash_profile
```

Have `git` remember your credentials:
```bash
git config credential.helper store
```

View the /includes folder for extended functionality.
* Functions --------- New terminals, Pull requests, YML/hosts syncs and IP binding.
  * Aliases
    * Capistrano ---- Deploying Rails.
    * Git ----------- Short and sweet is the way to git. Also auto complete branch names.
    * Rails --------- ENV, custom ports, bake and more.
    * Solr ---------- Tell the sun what to do.

### Comment and let's both get smarter.

*Credit to [shadoath](https://github.com/shadoath) for the base start of this repo*
