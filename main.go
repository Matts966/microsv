package main

import (
	"net/http"

	"github.com/gobuffalo/packr"
)

func main() {
	box := packr.NewBox("./static/")
	http.Handle("/", http.FileServer(box))
	http.ListenAndServe(":80", nil)
}
