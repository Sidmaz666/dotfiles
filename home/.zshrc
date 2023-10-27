export TERM="xterm-kitty"
zstyle ':omz:update' mode disabled
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
# Command Completion
zstyle ':completion::complete:*' gain-privileges 1
# Initialize PROMPT
autoload -Uz promptinit
promptinit
# Define the theme
prompt_minimal_setup() {
  PROMPT='%(?.%F{green}󱚣.%F{red}󱚡%?)%f %B%F{240}%1~%f%b '
}
# Add the theme to promptsys
prompt_themes+=( minimal )
# Load the theme
prompt minimal
function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}
alias zshrc="vim ~/.zshrc"
alias l='ls -l'
alias v='vim'
alias p='paru'
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
