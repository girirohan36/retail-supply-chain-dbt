-- Runs automatically on first container start (docker-entrypoint-initdb.d).
-- Creates the three-layer warehouse schemas.

CREATE SCHEMA IF NOT EXISTS raw;      -- landing zone: 1:1 with source CSVs
CREATE SCHEMA IF NOT EXISTS staging;  -- cleaned/typed dbt views
CREATE SCHEMA IF NOT EXISTS marts;    -- star schema: facts + dimensions

-- Optional: confirm creation in container logs
DO $$
BEGIN
  RAISE NOTICE 'Schemas ready: raw, staging, marts';
END $$;
