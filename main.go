package main

import (
	"log"

	tfg "github.com/tensorflow/tensorflow/tensorflow/go"
)

func main() {
	log.Printf("TF version is: %v", tfg.Version())
}
