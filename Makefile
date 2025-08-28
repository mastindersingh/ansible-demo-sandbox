start:
	bash scripts/start_lab.sh
ping:
	ansible -i inventory.ini web -m ping -vv
play:
	ansible-playbook -i inventory.ini site.yml -vv
