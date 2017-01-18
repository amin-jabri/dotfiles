# dotfiles
My personal dotfiles.

## Install



```shell
git clone https://github.com/amin-jabri/dotfiles.git
mv ~/.vimrc ~/.vimrc_save
mv ~/.bashrc ~/.bashrc_save
mv ~/.bash_profile ~/.bash_profile_save # On macOS
./dotfile/setup_dotfiles.sh
```

After cloning and running setup_dotfiles.sh, open vim and run 

```
:PluginInstall
```

