# ░░░ PATHS
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
eval "$($BREW_BIN/brew shellenv)"
export PATH=~/.npm-global/bin:$PATH

if [ -n "$SWAYSOCK" ] && [ -S "$SWAYSOCK" ]; then
    export SWAYSOCK="$SWAYSOCK"
else
    unset SWAYSOCK 2>/dev/null
fi


export TERM=xterm-256color  # or your terminal's correct TERM value
# ░░░ OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"

plugins=(git command-not-found)
source $ZSH/oh-my-zsh.sh

#   ZPLUG 

# Inicialización de Zplug
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# ---------------------------------------------------------------------
# Carga zsh-autoenv y le indica que use el nombre de archivo '.env'
# en lugar del predeterminado '.autoenv.zsh'
# ---------------------------------------------------------------------
zplug 'Tarrasch/zsh-autoenv'

export ZSH_AUTOENV_FILENAME=".env"
  
if ! zplug check; then
    zplug install
fi


# LOAD ALL PLUGINS
zplug load

# ░░░ STARSHIP
eval "$(starship init zsh)"

# ░░░ PLUGINS MANUALES
source $(dirname $BREW_BIN)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(dirname $BREW_BIN)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


zsh-autocomplete() {
  source $(dirname $BREW_BIN)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
}

# ░░░ LS COLORS
export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144"

# ░░░ FZF CONFIG
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# ░░░ ALIASES
alias ls='ls --color=auto'
alias vi='nvim'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

#   CARAPACE
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

#   ZOXIDE
eval "$(zoxide init zsh)"

#   ATUIN
eval "$(atuin init zsh)"

#  DIRENV
eval "$(direnv hook zsh)"
