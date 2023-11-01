FROM mcr.microsoft.com/devcontainers/python:0-3.9

USER root

RUN pip3 install -U copier pre-commit oca-port
RUN pipx install oca-maintainers-tools@git+https://github.com/OCA/maintainer-tools.git
RUN git config --system --add safe.directory '*' 

USER vscode
