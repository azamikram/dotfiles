# Path to your oh-my-zsh installation.
export ZSH=/home/azam/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby command-not-found github history-substring-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source /home/azam/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias sl="sl -e"
alias gs="git status"

# Custom aliases
alias sudo='sudo '
alias flush="sync; echo 1 | tee /proc/sys/vm/drop_caches"

DEFAULT_USER="azam"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
fortune -aes | cowsay | lolcat

open() { (command xdg-open "$@" > /dev/null 2>&1 &) }
ff() { (command firefox > /dev/null 2>&1 &) }

