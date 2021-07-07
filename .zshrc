
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# zinit plugins
#zinit light Aloxaf/fzf-tab
zinit ice from"gh" wait"1" silent pick"zsh-history-substring-search.plugin.zsh" lucid

# history
zinit ice wait"0" silent pick"history.zsh" lucid
zinit snippet OMZ::lib/history.zsh
zinit ice wait"0" silent pick"history.plugin.zsh" lucid
zinit snippet OMZ::plugins/history/history.plugin.zsh
# search history via substring
#zinit light zsh-users/zsh-history-substring-search 
# search through long list of commands with Ctrl+R
#zinit ice from"gh" wait"1" silent pick"history-search-multi-word.plugin.zsh" lucid
#zinit light zdharma/history-search-multi-word

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# autosuggestions
zinit ice wait"0" atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

### End of Zinit's installer chunk

source $HOME/.env.zsh

# Initialize starship prompt
eval "$(starship init zsh)"
