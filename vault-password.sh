#!/usr/bin/env bash

# How do I use this?
# 1) Ansible executes this script as its ANSIBLE_VAULT_PASSWORD_FILE
# 2) I want to source it to have ANSIBLE_VAULT_PASSWORD_FILE set 
#    to the script itself, for execution by vim-ansible-vault.

bitwarden_uuid='7d6a58c2-0da8-4374-b471-b25900dd51da'

# "How to detect if a script is being sourced"
# https://stackoverflow.com/a/28776166
(return 0 2>/dev/null) && sourced=1 || sourced=0
if [[ ${sourced} == 1 ]]
then
	# If sourced, return the path to this script as variable
	ANSIBLE_VAULT_PASSWORD_FILE="$(readlink -f "${BASH_SOURCE[0]}")"
	export ANSIBLE_VAULT_PASSWORD_FILE
else
	# Else get the password from bw
	exec bw get password "${bitwarden_uuid}"
fi

