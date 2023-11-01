FROM odoo:16.0

COPY ./startup.sh /

USER root

RUN pip3 install -U debugpy -t /tmp
RUN chmod +x /startup.sh

USER odoo

EXPOSE 8888

ENTRYPOINT ["/startup.sh"]
