# Path to your oh-my-zsh installation.
export ZSH=/Users/willb/.oh-my-zsh
export TERM="xterm-256color"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
POWERLEVEL9K_MODE="awesome-patched"
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="willb"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast node yarn bower osx extract zsh-wakatime vagrant git-extras httpie docker)

# User configuration
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# PATH stuff.
PATH="/Users/willb/go/bin:$PATH"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/sbin"
PATH="$PATH:/Users/willb/bin"
PATH="$PATH:/opt/metasploit-framework/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/opt/local/sbin"
PATH="$PATH:/Users/willb/perl5/bin"
PATH="$PATH:/opt/local/bin"
PATH="$PATH:$HOME/.yarn/bin"
PATH="$PATH:/Users/willb/.local/bin"
PATH="$PATH:/Users/willb/.cargo/bin"
PATH="$HOME/.ellipsis/bin:$PATH"
export PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   EDITOR='/usr/local/bin/vim'
else
   EDITOR='/usr/local/bin/vim'
fi
export EDITOR
# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias shit="git checkout -- ."
alias amend="git commit -a --amend --no-edit"
alias fuckit='git commit -am "$(curl -s whatthecommit.com/index.txt)"'
alias shite="kill -9 $(jobs -p)"
alias todos="todo.sh"
alias 2do="todo.sh"
alias serve="http-server -o -c-1"
alias updatemicro="(go get -d -v github.com/zyedidia/micro/...; cd $GOPATH/src/github.com/zyedidia/micro; make install)"
alias updateprojects="curl -X POST https://api.netlify.com/build_hooks/5924f53f3c1d5e1c2071f2cc"
alias getWifiJSON="scp gthsmini:~/WifiJSON/people.json ~/WifiJSON"
alias externalWifi="sudo /Library/Application\ Support/WLAN/StatusBarApp.app/Contents/MacOS/wpa_supplicant -Dosx -ien7  -c ~/wpa/profile1x.rtl"
alias toggle-prox=". prox-toggle"
alias lsdotfiles="printf '%s\n' .*"
#eval "$(thefuck --alias)"
PERL5LIB="/Users/willb/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/willb/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/willb/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/willb/perl5"; export PERL_MM_OPT;
source <(antibody init)
source ~/.zsh_secrets
zsh_Spotify () {
if [[ $(ps axo pid,command | grep "[S]potify.app") ]]; then
gr8=`spotify status`
artist=$(echo "$gr8" | grep -Ei -o 'Artist.*' | cut -f2 -d:)
track=$(echo "$gr8" | grep -Ei -o 'Track.*' | cut -f2 -d:)
#	state=`osascript -e 'tell application "Spotify" to player state as string'`;
#  if [ $state = "playing" ]; then
#	artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
#	track=`osascript -e 'tell application "Spotify" to name of current track as string'`;
#
	echo -n "$artist - $track";
 # fi

else
	echo -n "Spotify not running"
fi

}
POWERLEVEL9K_CUSTOM_IS_XCODE="zsh_isXcode"
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}


zsh_isXcode () {
	if [ -d "/Volumes/XCODE" ]; then
	XCODEEXISTS='Yes'
	POWERLEVEL9K_CUSTOM_IS_XCODE_BACKGROUND="155"
	POWERLEVEL9K_CUSTOM_IS_XCODE_FOREGROUND="096"
	echo -n "Xcode? $XCODEEXISTS"
else
	XCODEEXISTS='No'
	POWERLEVEL9K_CUSTOM_IS_XCODE_BACKGROUND="001"
	POWERLEVEL9K_CUSTOM_IS_XCODE_FOREGROUND="255"
	echo -n "Xcode? $XCODEEXISTS"
fi
}
zsh_proxy(){
	e=$(networksetup -getwebproxy wi-fi | grep "No")
	if [ -n "$e" ]; then
	  echo "Proxy: Off"
	else
	  echo "Proxy: On"
	fi
}
zsh_wifi_signal(){
		local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
		local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

		if [ "$airport" = "Off" ]; then
				local color='%F{yellow}'
				echo -n "%{$color%}Wifi Off"
		else
				local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
				local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
				local color='%F{yellow}'

				[[ $speed -gt 100 ]] && color='%F{green}'
				[[ $speed -lt 50 ]] && color='%F{red}'

				echo -n "%{$color%} \UE1AD $ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font
		fi
}

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="190"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="198"
#POWERLEVEL9K_CUSTOM_IS_XCODE_BACKGROUND="001"
#POWERLEVEL9K_CUSTOM_IS_XCODE_FOREGROUND="255"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_PROXY="zsh_proxy"
#POWERLEVEL9K_CUSTOM_ZSH_SPOTIFY="zsh_Spotify"
#POWERLEVEL9K_CUSTOM_ZSH_SPOTIFY_FOREGROUND="001"
#POWERLEVEL9K_CUSTOM_ZSH_SPOTIFY_BACKGROUND="087"
#POWERLEVEL9K_CUSTOM_IS_XCODE="zsh_isXcode"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_proxy  custom_wifi_signal node_version todo)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
neofetch
#eval "$(ntfy shell-integration)"
source $HOME/.zsh_proxy

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
ulimit -n 65536 65536

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/willb/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/willb/.config/yarn/global/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
