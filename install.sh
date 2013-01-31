# This originally comes from @alvarobp dotfiles:
# https://github.com/alvarobp/dotfiles

dotfiles_path=$(cd "$(dirname "$0")"; pwd)
current_date=`date "+%Y%m%d%H%M%S"`

function check_and_link_directory() {
  local path=$1

  if [ -d ~/$path ] || [ -h ~/$path ]
  then
    echo "\033[0;33mFound ~/$path\033[0m \033[0;32 Backing up to ~/$path.pre-$current_date\033[0m";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "\033[0;34mLinked ~/$path\033[0m"
}

function check_and_link_file() {
  local path=$1

  if [ -f ~/$path ] || [ -h ~/$path ]
  then
    echo "\033[0;33mFound ~/$path\033[0m \033[0;32 Backing up to ~/$path.pre-$current_date\033[0m";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "\033[0;34mLinked ~/$path\033[0m"
}

function check_and_install_oh_my_zsh() {
  if [ ! -d ~/.oh-my-zsh ]
  then
    echo "\033[0;34mCloning Oh My Zsh...\033[0m"
    /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

    echo "\033[0;34mSetting default shell to zsh\033[0m"
    chsh -s `which zsh`
  fi
}

# ZSH
check_and_install_oh_my_zsh
check_and_link_file ".zshrc"
check_and_link_directory ".zsh"

# GIT
check_and_link_file ".gitconfig"

# VIM
check_and_link_file ".vimrc"
check_and_link_directory ".vim"

/usr/bin/env zsh
source ~/.zshrc
