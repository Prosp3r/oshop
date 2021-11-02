package migrate

import (
	"database/sql"
	"flag"
	"fmt"
	"log"
	// "os"

	"github.com/golang-migrate/migrate"
	"github.com/golang-migrate/migrate/database/mysql"

	_ "github.com/go-sql-driver/mysql"
	// "github.com/golang-migrate/migrate/v4"
	// "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
)

var dbhost = "oshopdb" //os.Getenv("OSHOP_DB_HOST")
var dbname = "oshopdb" //os.Getenv("OSHOP_DB_NAME")
var dbuser = "dbadmin" //os.Getenv("OSHOP_DB_USER")
var dbpassword = "password1" //os.Getenv("OSHOP_DB_PASSWORD")
var dbport = "3306" //os.Getenv("OSHOP_DB_PORT")

func Migrate() bool {
	var migrationDir = flag.String("migration.files", "./migrations", "Directory where migration files are located")
	// var mysqlDSN = flag.String("mysql.dsn", os.Getenv("MYSQL_DSN"), "Mysql DSN")
	flag.Parse()

	var mysqlConString = dbuser + ":" + dbpassword + "@tcp("+ dbhost +":"+dbport+")/"
	db, err := sql.Open("mysql", mysqlConString)
	// fmt.Println(mysqlDSN)
	// fmt.Println(mysqlDSN)
	// db, err := sql.Open("mysql", *mysqlDSN)
	if err != nil {
		log.Fatalf("Could not connect to Database. Encounered the following error: %v \n", err)
		return false
	}

	if err := db.Ping(); err != nil {
		log.Fatalf("Coould not ping db at this time...%v \n", err)
		return false
	}

	//Run migrations
	// mysql.Config.DatabaseName = dbname
	driver, err := mysql.WithInstance(db, &mysql.Config{})
	if err != nil {
		log.Fatalf("Could not start mysql migrations...%v \n", err)
		return false
	}

	m, err := migrate.NewWithDatabaseInstance(
		fmt.Sprintf("file://%s", *migrationDir), "mysql", driver)

	if err != nil {
		log.Fatalf("migration failed...%v \n", err)
		return false
	}

	if err := m.Up(); err != nil && err != migrate.ErrNoChange {
		log.Fatalf("An error occured while syncing the database...%v \n", err)
		return false
	}

	log.Println("Database migration complete")

	return true
}
