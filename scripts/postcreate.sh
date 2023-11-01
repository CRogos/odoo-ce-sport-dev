#!/bin/bash

echo "Running postcreate.sh script"
sudo chown vscode:vscode /workspace
sudo chown vscode:vscode /home/vscode/.cache

cp -r /repo/.vscode /workspace/
cp /repo/.env /workspace/.env

# Change owner and rights of ssh keys
sudo chown vscode:vscode ~/.ssh/*
sudo chmod 0600 ~/.ssh/*

if ! test -d /workspace/odoo; then
    echo "Cloning git repositories"
    cd /workspace
    git clone -b 16.0 --single-branch git@github.com:odoo/odoo.git odoo
    git clone -b 16.0 --single-branch git@github.com:CRogos/odoo-ce-sport.git user
    cd /workspace/user
    # requires ssh key
    git submodule update --init

    # install pre-commit
    git submodule foreach pre-commit install
else
    echo "Git repositories already cloned"
fi




echo "Running postcreate.sh finished"