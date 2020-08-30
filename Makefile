VERSION=$(shell git describe --tags)

build:
	go build -ldflags "-X github.com/lemonade-command/lemonade/lemon.Version=$(VERSION)"

install:
	go install -ldflags "-X github.com/lemonade-command/lemonade/lemon.Version=$(VERSION)"

release:
	gox --arch 'amd64' --os 'darwin' --output "dist/{{.Dir}}_{{.OS}}_{{.Arch}}/{{.Dir}}" -ldflags "-X github.com/lemonade-command/lemonade/lemon.Version=$(VERSION)"
	tar zcvf pkg/lemonade_darwin_amd64.tar.gz -C dist/lemonade_darwin_amd64/ lemonade

clean:
	rm -rf dist/
	rm -f pkg/*.tar.gz pkg/*.zip
