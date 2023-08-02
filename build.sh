cd ../ui && gulp bundle && cd ../docs && npx --yes antora antora-playbook.yml --url "$1"
