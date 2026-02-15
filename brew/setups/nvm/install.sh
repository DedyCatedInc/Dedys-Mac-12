#!/bin/bash
set -euo pipefail

echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=$(basename "$0")
FILE=$(echo "$FILENAME0" | cut -d '.' -f 1)
echo "[$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]"
echo "......."

cd "$BASEDIR00"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Install it first: https://brew.sh/"
  exit 1
fi

brew update
brew "$FILE" "$CURRDIR00"
brew cleanup

NVM_DIR="${HOME}/.nvm"
mkdir -p "$NVM_DIR"

BREW_PREFIX="$(brew --prefix)"
NVM_SH="${BREW_PREFIX}/opt/nvm/nvm.sh"
NVM_COMPLETION="${BREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"

echo ""
echo "nvm installed via Homebrew."
echo "Adding nvm init lines to your shell profile..."

PROFILE_FILES=()
if [ "$(uname -s)" = "Darwin" ]; then
  PROFILE_FILES+=("${HOME}/.zshrc" "${HOME}/.zprofile")
else
  if [ -n "${ZSH_VERSION-}" ] || [ "${SHELL##*/}" = "zsh" ]; then
    PROFILE_FILES+=("${HOME}/.zshrc")
  elif [ -n "${BASH_VERSION-}" ] || [ "${SHELL##*/}" = "bash" ]; then
    PROFILE_FILES+=("${HOME}/.bashrc")
  else
    PROFILE_FILES+=("${HOME}/.zshrc")
  fi
fi

NVM_LINES=(
  "export NVM_DIR=\"${NVM_DIR}\""
  "[ -s \"${NVM_SH}\" ] && \\. \"${NVM_SH}\"  # This loads nvm"
  "[ -s \"${NVM_COMPLETION}\" ] && \\. \"${NVM_COMPLETION}\"  # This loads nvm bash_completion"
)

for profile in "${PROFILE_FILES[@]}"; do
  touch "$profile"
  for line in "${NVM_LINES[@]}"; do
    if ! grep -Fq "$line" "$profile"; then
      echo "$line" >> "$profile"
    fi
  done
  echo "Updated: ${profile}"
done

echo "Then restart your terminal or run: source \"${HOME}/.zshrc\""

exit 0
