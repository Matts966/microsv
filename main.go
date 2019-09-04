package main

import (
	"log"
	"net/http"

	"github.com/gobuffalo/packr/v2"
)

func main() {
	box := packr.New("box", "./static")
	http.Handle("/", http.FileServer(box))
	log.Fatal(http.ListenAndServe(":80", nil))
}
