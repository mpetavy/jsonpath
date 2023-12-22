package main

import (
	"embed"
	"flag"
	"fmt"
	"github.com/mpetavy/common"
	"github.com/spyzhov/ajson"
	"io"
	"os"
	"strings"
)

var (
	f *string
	q *string
)

//go:embed go.mod
var resources embed.FS

func init() {
	common.Init("", "", "", "", "parse and query json", "", "", "", &resources, nil, nil, run, 0)

	f = flag.String("f", "", "file to parse, read STDIN when omitted")
	q = flag.String("q", "", "github.com/tidwall/gjson query")
}

func TrimApostroph(str string) string {
	s := 0
	e := len(str)
	if strings.HasPrefix(str, "\"") {
		s++
	}
	if strings.HasSuffix(str, "\"") {
		e--
	}

	return str[s:e]
}

func run() error {
	var b []byte
	var err error

	if *f == "" {
		b, err = io.ReadAll(os.Stdin)
	} else {
		b, err = os.ReadFile(*f)
	}
	if err != nil {
		return err
	}

	r, err := ajson.JSONPath(b, *q)
	if err != nil {
		return err
	}

	for _, node := range r {
		fmt.Printf("%s\n", TrimApostroph(node.String()))
	}

	return nil
}

func main() {
	common.Run(nil)
}
