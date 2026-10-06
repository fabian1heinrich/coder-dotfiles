HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups

autoload -Uz compinit
_coder_zcompdump_dir="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"
mkdir -p "${_coder_zcompdump_dir}"
compinit -d "${_coder_zcompdump_dir}/zcompdump"
unset _coder_zcompdump_dir

alias ll='ls -alF'
alias gs='git status --short --branch'

if [[ -z "${EDITOR:-}" ]] && (( ${+commands[vim]} )); then
  export EDITOR=vim
fi
if [[ -z "${VISUAL:-}" && -n "${EDITOR:-}" ]]; then
  export VISUAL="${EDITOR}"
fi
if [[ -z "${PAGER:-}" ]] && (( ${+commands[less]} )); then
  export PAGER=less
fi

autoload -Uz add-zsh-hook vcs_info
zstyle ':vcs_info:git:*' formats ' %F{magenta}(%b)%f'

_coder_update_vcs_info() {
  vcs_info
}

add-zsh-hook -d precmd _coder_update_vcs_info 2>/dev/null || true
add-zsh-hook precmd _coder_update_vcs_info

setopt prompt_subst
PROMPT='%F{cyan}%2~%f${vcs_info_msg_0_} %# '
