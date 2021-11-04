package main

import (
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	// mig := migrate.Migrate()
	// fmt.Println(mig)

	router := mux.NewRouter()

	router.HandleFunc("/", HomePage).Methods("GET")

	router.HandleFunc("/products", GetProducts).Methods("GET")
	router.HandleFunc("/products", AddProducts).Methods("POST")
	router.HandleFunc("/products", EditProducts).Methods("PUT")
	router.HandleFunc("/products", DeleteProducts).Methods("DELETE")

	router.HandleFunc("/users/", GetUsers).Methods("GET")
	router.HandleFunc("/users/{userid:[0-9]+}", GetUser).Methods("GET")
	router.HandleFunc("/users/{userid:[0-9]+}", UpdateUser).Methods("PUT")
	router.HandleFunc("/users", CreateUser).Methods("POST")
	router.HandleFunc("/users/{userid:[0-9]+}", DeleteUser).Methods("DELETE")

	router.HandleFunc("/purchases", GetPurchases).Methods("GET") //admin
	router.HandleFunc("/purchases/{userid:[0-9]+}", GetPurchases).Methods("GET")
	router.HandleFunc("/purchase", CreatePurchase).Methods("POST")
	router.HandleFunc("/purchase/{purchaseid:[0-9]+}", UpdatePurchase).Methods("PUT")
	router.HandleFunc("/purchase/{purchaseid:[0-9]+}", DeletePurchase).Methods("DELETE")

	http.ListenAndServe(":8080", router)
}

func HomePage(w http.ResponseWriter, r *http.Request){
	msg := "Welcome Oshop"
	w.Write([]byte(msg))
}

func GetProducts(w http.ResponseWriter, r *http.Request)    {}
func AddProducts(w http.ResponseWriter, r *http.Request)    {}
func EditProducts(w http.ResponseWriter, r *http.Request)   {}
func DeleteProducts(w http.ResponseWriter, r *http.Request) {}

func GetUsers(w http.ResponseWriter, r *http.Request)   {}
func GetUser(w http.ResponseWriter, r *http.Request)   {}
func CreateUser(w http.ResponseWriter, r *http.Request) {}
func UpdateUser(w http.ResponseWriter, r *http.Request) {}
func DeleteUser(w http.ResponseWriter, r *http.Request) {}

func GetPurchases(w http.ResponseWriter, r *http.Request)   {}
func CreatePurchase(w http.ResponseWriter, r *http.Request) {}
func UpdatePurchase(w http.ResponseWriter, r *http.Request) {}
func DeletePurchase(w http.ResponseWriter, r *http.Request) {}