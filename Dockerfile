FROM postgres:15

LABEL org.opencontainers.image.source="https://github.com/eigenwallet/postgres-pgcron"
LABEL org.opencontainers.image.description="PostgreSQL 15 with pg_cron extension"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-15-cron \
    && rm -rf /var/lib/apt/lists/*
