# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Function to display the current virtual environment without extra spaces
function venv_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "($(basename $VIRTUAL_ENV))"  # No spaces inside parentheses
  fi
}

# Enable vcs_info to display Git branch
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'  # %b shows the branch name
precmd_functions+=(vcs_info)             # Load vcs_info before each prompt

# Define the prompt using a new function
function set_prompt {
  local venv_info="$(venv_prompt)"       # Gets virtual environment info
  PROMPT="${venv_info}%F{yellow}%~%f ${vcs_info_msg_0_} %# "
}

# Register the prompt function to update before each command
precmd_functions+=(set_prompt)
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
