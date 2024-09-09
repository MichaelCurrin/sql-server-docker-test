APP_NAME = sqlpreview
# The password must be at least 8 characters long and contain characters from
# three of the following four sets: Uppercase letters, Lowercase letters, Base
# 10 digits, and Symbols..
PASSWORD = my(!)Password
IMAGE = mcr.microsoft.com/mssql/server:2022-latest

pull:
	docker pull $(IMAGE)

# Leave off --rm so data persists. But then need to view logs to see what is
# going on and delete and recreated for new setup.
#
# Note platform is needed to avoid error on macOS M1.
run:
	docker run \
		-e "ACCEPT_EULA=Y" \
		-e "MSSQL_SA_PASSWORD=$(PASSWORD)" \
		-e "MSSQL_PID=Evaluation" \
		-p 1433:1433 \
		--name $(APP_NAME) \
		--hostname sqlpreview \
		--platform linux/amd64 \
		--volume "$(PWD)":/app \
		-d \
		$(IMAGE)

stop:
	docker stop $(APP_NAME) && true

rm:
	docker rm $(APP_NAME)

start:
	docker start $(APP_NAME)

logs:
	docker logs -f $(APP_NAME)

s: stop rm run logs

shell:
	docker exec -it $(APP_NAME) bash

# Using Microsoft ODBC Driver 18 for SQL Server.
# Note the "18" bit was missing from the docs but was found through exploring.
# Note `-C` to disable SSL or `-No` to trust server cert (had to had "o" as per Docker hub).
sql:
	docker exec -it $(APP_NAME) \
		/opt/mssql-tools18/bin/sqlcmd \
		-S localhost \
		-U sa \
		-P '$(PASSWORD)' \
		-No

sql-scripts:
	cd scripts && \
		./main.sh
