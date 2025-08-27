-- Cria schemas
CREATE SCHEMA IF NOT EXISTS users;
CREATE SCHEMA IF NOT EXISTS finance;

-- Cria usuários de banco
CREATE USER topuser WITH PASSWORD 'toppass';
CREATE USER topfinance WITH PASSWORD 'financepass';

-- Concede permissões específicas
GRANT USAGE ON SCHEMA users TO topuser;
GRANT ALL PRIVILEGES ON SCHEMA users TO topuser;

GRANT USAGE ON SCHEMA finance TO topfinance;
GRANT ALL PRIVILEGES ON SCHEMA finance TO topfinance;
