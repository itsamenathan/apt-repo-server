NAME = itsamenathan/apt-repo-server
VERSION = 0.2

.PHONY: all build test tag_latest release ssh

all: build

build:
	docker build -t $(NAME):$(VERSION) --rm --no-cache=true --pull=true .

test:
	docker run --rm -p 80:80 -v ${PWD}/data:/data $(NAME):$(VERSION)

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! head -n 1 Changelog.md | grep -q -F $(VERSION); then echo 'Please note the release date in Changelog.md.' && false; fi
	docker push $(NAME)

