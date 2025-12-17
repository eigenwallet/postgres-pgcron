# postgres-pgcron

PostgreSQL 15 Docker image with the [pg_cron](https://github.com/citusdata/pg_cron) extension pre-installed.

## Usage

```bash
docker pull ghcr.io/eigenwallet/postgres-pgcron:15
```

### Docker Compose

```yaml
services:
  db:
    image: ghcr.io/eigenwallet/postgres-pgcron:15
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: mydb
    command: >
      postgres
      -c shared_preload_libraries=pg_cron
      -c cron.database_name=mydb
```

### Docker Run

```bash
docker run -d \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=mydb \
  -p 5432:5432 \
  ghcr.io/eigenwallet/postgres-pgcron:15 \
  postgres \
  -c shared_preload_libraries=pg_cron \
  -c cron.database_name=mydb
```

### Enable pg_cron in your database

```sql
CREATE EXTENSION IF NOT EXISTS pg_cron;
```

## Building locally

```bash
docker build -t postgres-pgcron:15 .
```
