package main

import (
	"log"
	"net/http"

	"github.com/gobuffalo/packr"
)

func main() {
	box := packr.NewBox("./static")
	http.Handle("/", http.FileServer(box))
	log.Fatal(http.ListenAndServe(":80", nil))
}
