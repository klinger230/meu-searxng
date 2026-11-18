FROM docker.io/searxng/searxng:latest

USER root

COPY settings.yml /etc/searxng/settings.yml

RUN mkdir -p /etc/searxng /var/cache/searxng && \
    chmod -R 777 /etc/searxng /var/cache/searxng

ENV SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml

EXPOSE 10000

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/searxng/.venv/bin/granian --interface wsgi --host 0.0.0.0 --port ${PORT:-10000} --workers 1 searx.webapp:app"]
