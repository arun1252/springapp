docker pull akashsarkar1/library-jdbc
docker pull akashsarkar1/library-angular
docker network create library-mysql
docker container run --name mysqldb --network library-mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=testdb -d mysql:8
docker container run --network library-mysql --name library-jdbc-container -p 8083:8083 -d library-jdbc
docker container run --network library-mysql --name library-angular-container -p 8081:8081 -d library-angular
