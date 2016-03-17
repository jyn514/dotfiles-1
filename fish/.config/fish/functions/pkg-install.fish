#!/usr/bin/fish

# install a package using the preferred package manager

function pkg-install
    switch (get-pkg-manager)
    case pacaur 
        pacaur -S $argv
    case pacman 
        sudo pacman -S $argv
    case apt-get
        sudo apt-get install $argv
    case aptitude 
        sudo aptitude install $argv
    case yum 
        sudo yum install $argv
    case brew
        brew install $argv
    end
end