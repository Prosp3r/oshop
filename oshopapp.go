package main

import (
	"fmt"
	"github.com/oshop/db"
)

func main(){
	mig := migrate.Migrate()
	fmt.Println(mig)
}