nvim_folder=~/.config/nvim
# nerd_tree_bookmarks=~/.NERDTreeBookmarks
backup_rand=$RANDOM

# detect if there's a .vim folder
if [ -d $nvim_folder  ]
then
  echo "\033[0;31mYou already have a nvim folder in your home directory.\033[0;m"
    read -p "Would you like to backup your nvim folder first? [y/n] " ans
    if [ "$ans" == "y"  ]
      then
        echo "backup your original $nvim_folder to $nvim_folder-$(date +%Y%m%d)-$backup_rand"
        mv $nvim_folder $nvim_folder-$(date +%Y%m%d)-$backup_rand
      else
        echo "You have a $nvim_folder now, please backup this first."
        exit
  fi
fi

# check if Git is installed
hash git >/dev/null && /usr/bin/env git clone clone -b lua git@github.com:zouzonghua/nvim.git ~/.config/nvim || {
    echo "Sorry, Git is not installed yet!"
  exit
}

# make symbolic links
# echo "link other config file to your home directory.."
# ln -s $nvim_folder/NERDTreeBookmarks $nerd_tree_bookmarks

# run PackerSync to install all plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo ""
echo "\033[0;34mNice! Seems everything is going well.\033[0m"
echo "\033[0;34mGithub Repository: https://github.com/zouzonghua/nvim/\033[0m"
echo "\033[0;34mfeel free to fork it :)\033[0m"
echo ""
echo "\033[0;34mPeace :)\033[0m"
echo ""

exit

