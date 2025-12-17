ARG PG_VERSION
FROM postgres:${PG_VERSION}

LABEL org.opencontainers.image.source="https://github.com/eigenwallet/postgres-pgcron"
LABEL org.opencontainers.image.description="PostgreSQL ${PG_VERSION} with pg_cron extension"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        gnupg \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends postgresql-${PG_VERSION}-cron \
    && apt-get purge -y --auto-remove ca-certificates wget gnupg \
    && rm -rf /var/lib/apt/lists/*
