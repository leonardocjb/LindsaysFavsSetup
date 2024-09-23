############CLT setup ###########
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/terminalTheme.omp.json)"
eval $(thefuck --alias)
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

############Base16 Shell############
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
base16_material

########### cowsay fortune ############
function randomCow() {
    local cowcommands=("cowsay" "cowthink");
    local random_command=${cowcommands[$(gshuf -i1-2 -n1)]};

    fortune | $random_command -f $(cowsay -l | tail -n+2 | tr ' ' '\n' | gshuf -n1) | lolcat
}

randomCow

########### U of T commands ############

function ecf() {
    ssh cuijiab1@remote.ecf.utoronto.ca;
}

function cslab() {
    ssh cuijiab1@teach.cs.utoronto.ca;
}

########### UHN commands ############
function h4h () {
    sshfs t114231uhn@h4huhnlogin1.uhnresearch.ca:/cluster/home/t114231uhn/local_computer $HOME/h4h/;
    ssh t114231uhn@h4huhnlogin1.uhnresearch.ca;    
} 

function transfer_from_h4h (){
    echo "transfering file from $1 to $2"
    rsync -r --progress t114231uhn@172.27.23.173:$1 $2
}

function transfer_to_h4h (){
    echo "transfering file from $1 to $2"
    rsync -r $1 t114231uhn@172.27.23.173:$2
}
########### better commands ############
alias vb="vim $HOME/.zshrc"
alias sb="source $HOME/.zshrc"
alias vi="vim"
alias ll="eza -al --icons=auto --group-directories-first"
alias lh="eza -dl .* --group-directories-first"
alias cat='bat'
alias cd='z'
alias ls='eza --icons=auto'
