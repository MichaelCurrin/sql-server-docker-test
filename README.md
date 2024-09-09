# SQL Server Docker test
> Exploratory project to setup and connect to SQL Server DB using Docker

## Usage

### Container management

Start SQL Server container:

```sh
$ make run
```

Check the logs:

```sh
$ make logs
```

Stop and start:

```sh
$ make stop
$ make start
```

### Shell access

Enter interactive Bash shell:

```sh
$ make shell
```

Enter interactive SQL console:

```sh
$ make sql
```

### Run SQL in the database

1. Start a Bash shell in the container as above.
1. Run the shell script there:
    ```sh
    $ cd /app/scripts/
    $ ./main.sh
    ```

## Connect with DB UI

Connect to the DB in the container using desktops apps. Then you can run the `.sql` files in [scripts](/scripts/).

Credentials:

- Server: `localhost` (not needed to add port)
- Password: `my(!)Password`

### VS Code extension

Install https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql

Connect.

Enable trust if there is an error.

### DB tool

Download Azure Data Studio https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio

Under Connections, create server.

Set Encrypt as Optional.


## Links

### Docker image

https://hub.docker.com/r/microsoft/mssql-server

### DB UI tools

- DBeaver https://dbeaver.io/
- Navicat, paid tool https://www.navicat.com/en
- SQL Server Management Studio instructions (may need to find community of free version). https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16
- DataGrip
