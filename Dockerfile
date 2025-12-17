ARG PG_MAJOR
FROM postgres:${PG_MAJOR}

LABEL org.opencontainers.image.source="https://github.com/eigenwallet/postgres-pgcron"
LABEL org.opencontainers.image.description="PostgreSQL ${PG_MAJOR} with pg_cron extension"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-${PG_MAJOR}-cron \
    && rm -rf /var/lib/apt/lists/*
