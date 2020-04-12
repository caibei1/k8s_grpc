package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"net/http"
)

// govendor fetch github.com/gin-gonic/gin
// govendor add github.com/go-sql-driver/mysql

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	result ,err := searchForeMysql()
	if err != nil {
		fmt.Fprintln(w, err.Error())
		return
	}
	fmt.Fprintln(w, result)
}

func main() {
	http.HandleFunc("/", IndexHandler)
	http.ListenAndServe("0.0.0.0:8000", nil)
}


func searchForeMysql() (map[string]int,error) {

	// mysql-service 这边用名字代替了ip地址
	db,err := sql.Open("mysql","root:ww0819@tcp(mysql-service:3306)/test?charset=utf8")
	if err != nil{
		fmt.Printf("connect mysql fail ! [%s]",err)
		return nil,err
	}else{
		fmt.Println("connect to mysql success")
	}

	rows,err := db.Query("select id,username from user")
	if err != nil{
		fmt.Printf("select fail [%s]",err)
		return nil,err
	}

	var mapUser map[string]int
	mapUser = make(map[string]int)

	for rows.Next(){
		var id int
		var username string
		rows.Columns()
		err := rows.Scan(&id,&username)
		if err != nil{
			fmt.Printf("get user info error [%s]",err)
			return nil,err
		}
		mapUser[username] = id
	}

	for k,v := range mapUser{
		fmt.Println(k,v)
	}
	return mapUser,nil

}