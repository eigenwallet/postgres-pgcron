ARG PG_VERSION
FROM postgres:${PG_VERSION}

LABEL org.opencontainers.image.source="https://github.com/eigenwallet/postgres-pgcron"
LABEL org.opencontainers.image.description="PostgreSQL ${PG_VERSION} with pg_cron extension"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-${PG_VERSION}-cron \
    && rm -rf /var/lib/apt/lists/*
