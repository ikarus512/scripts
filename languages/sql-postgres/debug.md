# PL/SQL language topics
### debugging plugin:
Install plugin_debugger. On Windows: plugin_debugger.dll already installed with PostgreSQL. On Ubuntu: to install plugin_debugger.so (and pgostgre sql, pgadmin), run: sudo apt install -y postgresql pgadmin3 postgresql-10-pldebugger
In file postgresql.conf insert (or uncomment) the line:
	shared_preload_libraries = '$libdir/plugin_debugger'                 (and restart the system)
On Windows, the file can be found by default in C:\Apps\PostgreSQL\9.6\data\postgresql.conf (if PostgreSQL installed to C:\Apps\PostgreSQL).
On Ubuntu, the file can be found in /etc/postgresql/10/main/postgresql.conf
run: psql --host localhost --dbname=<dbname> --command 'CREATE EXTENSION pldbgapi;' (or run the command 'CREATE EXTENSION pldbgapi;' in PGAdmin within needed database)
Now, in PGAdmin, you can select any function, right-click on function name, choose 'Debugging/Debug' to start debugging it.
Note 1. I tried to debug on Windows localhost (PostgreSQL 9.6). It often hangs. Also tried on Ubuntu (PostgreSQL 10/PGAdmin3) -- it works ok.
Note 2. Printf-style debugging example, using RAISE command. To print a table row (DECLARE a_table_raw a_table%ROWTYPE), add the following line to SQL function:
        RAISE NOTICE 'a_table_raw = %', to_json(a_table_raw);
        RAISE NOTICE E'a_table_raw = %\n', to_json(a_table_raw);
### verbosity
log_error_verbocity = TERSE # in /etc/postgres/$pgver/main/postgres.conf file, to not show RAISE NOTICE CONTEXT.
### debug printf messages
    RAISE NOTICE E'a_table_raw = %\n', to_json(a_table_raw);


# References
Common:
  - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04

Passwords file on Windows/Linux:
  - https://www.postgresql.org/docs/9.3/static/libpq-pgpass.html
  - C:\Users\$USER\AppData\Roaming\postgresql\pgpass.conf
  - ~/.pgpass

Diagram tools review:
  - https://severalnines.com/database-blog/overview-database-diagram-tools-available-postgresql

Free tools with diagram:
  - DBeaver CE ("Community Edition" version is Free one): https://dbeaver.io/
  - PgModeler (Free, if compiled yourself): https://pgmodeler.io/

Online (own limited text format):
  - https://dbdiagram.io/d
