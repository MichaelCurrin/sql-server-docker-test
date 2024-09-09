#!/usr/bin/env bash

# Aliases don't work in non-interactive shell scripts.
mssql() {
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "my(!)Password" -No "$@"
}

echo '=== Setup ==='
mssql -i setup.sql

echo '=== Test ==='
mssql -i test.sql
