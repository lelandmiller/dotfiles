# Lines configured by zsh-newuser-install
setopt appendhistory extendedglob nomatch
unsetopt autocd
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lelandmiller/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/dirhistory
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gulp
    #zgen oh-my-zsh plugins/lein
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/sudo
    #zgen oh-my-zsh plugins/vi-mode

    zgen load tarruda/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting
    #zgen load nviennot/zsh-vim-plugin

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    #zgen oh-my-zsh themes/eastwood
    zgen oh-my-zsh themes/agnoster
    #antigen theme ~/dotfiles/pkg/zsh themes/eastwood_custom

    # save all to init script
    zgen save
fi

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi


#source "${ZDOTDIR:-$HOME}/base16-builder/output/shell/base16-monokai.dark.sh"
#export PATH=/home/lelandmiller/bin:$PATH
path+=("${HOME}/.cargo/bin")
path+=("${HOME}/bin" "${HOME}/Library/Haskell/bin")
path+=("${HOME}/local/bin")
path+=("${HOME}/bin/gradle-3.3/bin")
PATH=${HOME}/.npm-packages/bin:$PATH
path+=("${HOME}/dotfiles/bin")
path+=("${HOME}/.gem/ruby/2.2.0/bin")
path+=("${HOME}/.gem/ruby/2.6.0/bin")

export BROWSER=google-chrome-stable
export TERM=xterm-256color # Get colors in ls etc
export EDITOR=nvim
bindkey -e

# Go Stuff
path+=("${HOME}/go/bin")
export GOPATH=~/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#setfont sun12x22

# FOR MACPORTS
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

path+=("/usr/local/lib/python2.7/site-packages")

alias fuck='eval $(thefuck $(fc -ln -1))'

alias raa="cd ~/lmi/raascal-mono/"
alias dev="cd ~/code"

export NVM_DIR="/Users/lelandmiller/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

cdpath=(~ ~/citrix)


#LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
#export LS_COLORS
alias distc="git checkout dist && git clean -fd dist"
alias vs="visual-studio-code ."
alias sl="subl3 ."

#source ~/dotfiles/pkg/base16-atelier-lakeside.sh

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

## c/o http://lynnard.me/blog/2014/01/05/change-cursor-shape-for-zsh-vi-mode/
#echo -ne "\e[4 q"
#zle-keymap-select () {
    #if [ "$TERM" = "xterm-256color" ]; then
        #if [ $KEYMAP = vicmd ]; then
            ## the command mode for vi
            #echo -ne "\e[2 q"
        #else
            ## the insert mode for vi
            #echo -ne "\e[4 q"
        #fi
    #fi
#}

## 10ms for key sequences
#KEYTIMEOUT=1

source ~/.secrets.zsh
