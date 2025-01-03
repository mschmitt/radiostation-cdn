all:
	ANSIBLE_VAULT_PASSWORD_FILE=./vault-password.sh ansible-playbook -i inventory.yml main.yml
