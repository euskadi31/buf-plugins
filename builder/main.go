package main

import (
	"html/template"
	"os"
)

type TemplateContext struct {
	Version string
}

func main() {
	version := os.Args[1]
	srcFileName := os.Args[2]
	dstFileName := os.Args[3]

	src, err := os.ReadFile(srcFileName)
	if err != nil {
		panic(err)
	}

	tmpl, err := template.New("Dockerfile").Parse(string(src))
	if err != nil {
		panic(err)
	}

	f, err := os.Create(dstFileName)
	if err != nil {
		panic(err)
	}
	defer f.Close()

	err = tmpl.Execute(f, &TemplateContext{
		Version: version,
	})
	if err != nil {
		panic(err)
	}
}
