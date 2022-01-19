package main

import (
	"fmt"
	"log"
	"os"
	"sync"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/load"
)

var (
	config *load.Config
	mutex  sync.Mutex
)

func main() {

	overlay := make(map[string]load.Source)
	_, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	config = &load.Config{
		Overlay: overlay,
		//Dir:        filepath.Join(wd, "pkg/template"),
		//ModuleRoot: filepath.Join(wd, "pkg/template"),
		Tags: []string{
			`app={"apiVersion":"platform.cloudplane.org/v1alpha1","kind":"App","metadata":{"creationTimestamp":"2022-01-18T00:38:27Z","generation":1,"labels":{"platform.cloudplane.org/identity-id":"3fd34cd3-ef25-4459-8913-5345c9f1988f","platform.cloudplane.org/platform":"dev","platform.cloudplane.org/pool":"pool1"},"name":"ghost-cd5glchr","namespace":"dev","resourceVersion":"1409079","uid":"c3d012e8-9af7-4426-9b46-5842b568890b"},"spec":{"blockStorage":{"size":"1G"},"domains":{"primary":"foo.com"},"instance":"nano","name":"Ghost","replicas":1,"type":"ghost","values":{"email":"jakob@gillich.me","password":"WZoPWq4m6CLHZXHm"}},"status":{"availableReplicas":0,"readyReplicas":0}}`,
		},
	}

	go func() {
		for i := 0; i < 10; i++ {
			if _, err := build([]string{"./ghost", "./common"}); err != nil {
				panic(err)
			} else {
				log.Printf("OK %v", i)
			}
		}
	}()
	for i := 0; i < 10; i++ {
		if _, err := build([]string{"./ghost", "./common"}); err != nil {
			panic(err)
		} else {
			log.Printf("OK %v", i)
		}
	}
}

func build(args []string) ([]byte, error) {
	mutex.Lock()
	defer mutex.Unlock()

	instances := load.Instances(args, config)

	for _, b := range instances {
		if err := b.Err; err != nil {
			for _, err := range errors.Errors(err) {
				log.Printf("load instance err 1: %v", err)
			}

			return nil, fmt.Errorf("failed to load instances: %w", err)
		}
	}

	defs := cue.Build(instances)
	for _, def := range defs {
		if err := def.Err; err != nil {
			return nil, fmt.Errorf("failed to build instance: %w", err)
		}
	}

	return defs[0].Value().MarshalJSON()
}
