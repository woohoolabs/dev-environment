#!/usr/bin/env bash
set -e

if [ "$XCODE_INSTALL" == "1" ]; then
    echo -e "Installing Xcode..."
    xcode-select --install
fi

echo -e "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo -e "Installing Gettext..."
brew install gettext
ln -s -f /usr/local/opt/gettext/bin/envsubst /usr/local/bin/envsubst

echo -e "Installing Bash completions..."
brew install bash-completion
brew tap homebrew/homebrew-core
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

if [ "$ZSH_INSTALL" == "1" ]; then
    echo -e "Installing Zsh..."
    brew install zsh

    echo -e "Installing iTerm2..."
    brew cask install iterm2

    echo -e "Installing Oh-My-Zshell..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm -Rf ~/.oh-my-zsh/custom/themes/powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

    echo -e "Installing Powerline fonts..."
    rm -Rf /tmp/fonts
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
    /tmp/fonts/install.sh
    rm -rf /tmp/fonts
fi

if [ "$CHROME_INSTALL" == "1" ]; then
    echo -e "Installing Chrome..."
    brew cask install google-chrome
fi

if [ "$GIT_INSTALL" == "1" ]; then
    echo -e "Installing Git..."
    brew install git
    brew cask install github
fi

if [ "$GPG_INSTALL" == "1" ]; then
    echo -e "Installing GPG Suite..."
    brew cask install gpg-suite
fi

if [ "$DOCKER_INSTALL" == "1" ]; then
    echo -e "Installing Docker..."
    brew cask install docker
fi

if [ "$PHP_INSTALL" == "1" ]; then
    echo -e "Installing PHP..."
    brew install php@7.4
fi

if [ "$COMPOSER_INSTALL" == "1" ]; then
    echo -e "Installing Composer..."

    EXPECTED_CHECKSUM="$(curl -q -o - https://composer.github.io/installer.sig)"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
    then
        >&2 echo 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet
    rm composer-setup.php

    mv composer.phar /usr/local/bin/composer
    chmod +x /usr/local/bin/composer
    composer --quiet
fi

if [ "$PHPSTORM_INSTALL" == "1" ]; then
    echo -e "Installing PHPStorm..."
    brew cask install jetbrains-toolbox
fi

if [ "$NGINX_INSTALL" == "1" ]; then
    echo -e "Installing NGINX..."
    brew install nginx
fi

if [ "$MYSQL_WORKBENCH_INSTALL" == "1" ]; then
    echo -e "Installing MySQL Workbench..."
    brew cask install mysqlworkbench
fi

if [ "$POEDIT_INSTALL" == "1" ]; then
    echo -e "Installing Poedit..."
    brew cask install poedit
fi

if [ "$POSTMAN_INSTALL" == "1" ]; then
    echo -e "Installing Postman..."
    brew cask install postman
fi

if [ "$SLACK_INSTALL" == "1" ]; then
    echo -e "Installing Slack..."
    brew cask install slack
fi

if [ "$PHP_DEV_TOOLS_INSTALL" == "1" ]; then
    echo -e "Installing PHP development tools..."
    brew install autoconf automake libtool libiconv bison re2c libxml2 openssl pkg-config icu4c
    brew link bison --force
    brew link libxml2 --force
    brew link icu4c --force
fi

if [ "$AERIAL_INSTALL" == "1" ]; then
    echo -e "Installing Aerial screen saver..."
    brew cask install aerial
fi
