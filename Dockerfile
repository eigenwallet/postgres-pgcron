ARG PG_VERSION
FROM postgres:${PG_VERSION}

LABEL org.opencontainers.image.source="https://github.com/eigenwallet/postgres-pgcron"
LABEL org.opencontainers.image.description="PostgreSQL ${PG_VERSION} with pg_cron extension"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt $(. /etc/os-release && echo $VERSION_CODENAME)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends postgresql-${PG_VERSION}-cron \
    && apt-get purge -y --auto-remove ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
