#!/usr/bin/env zsh

set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ROOTDIR

# Host file location
HOSTS="$ROOTDIR/hosts"

# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yml"


# Installs ansible
if pacman -Qs ansible > /dev/null ; then
  echo "Ansible is installed"
else
  pacman -S ansible
fi

# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0