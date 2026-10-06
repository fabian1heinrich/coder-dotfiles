#!/bin/sh

set -eu

repo_dir=$(unset CDPATH; cd -- "$(dirname -- "$0")" && pwd)
config_dir="${HOME}/.config/coder"
prompt_file="${config_dir}/zsh-prompt.zsh"
zshrc="${HOME}/.zshrc"
source_line="[ -r \"\$HOME/.config/coder/zsh-prompt.zsh\" ] && source \"\$HOME/.config/coder/zsh-prompt.zsh\""

install -d -m 0755 "${config_dir}"
install -m 0644 "${repo_dir}/zsh-prompt.zsh" "${prompt_file}"

touch "${zshrc}"
if ! grep -Fqx "${source_line}" "${zshrc}"; then
  printf '\n%s\n' "${source_line}" >> "${zshrc}"
fi
