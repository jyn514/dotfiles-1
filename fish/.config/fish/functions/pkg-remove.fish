function pkg-remove
    switch (get-pkg-manager)
    case pacaur 
        pacaur -R $argv
    case pacman 
        sudo pacman -R $argv
    case apt-get
        sudo apt-get remove $argv
    case aptitude 
        sudo aptitude remove $argv
    case yum 
        sudo yum remove $argv
    case brew
        brew remove $argv
    end
end
