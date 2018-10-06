VERSIONS = $(foreach df,$(wildcard */Dockerfile),$(df:%/Dockerfile=%))

all: build

build: $(VERSIONS)

define postgis-version
$1:
	cp *.sh $(1)/
	cp *.sh $(1)/alpine/
	cp -r anyarray $(1)/
	cp -r anyarray $(1)/alpine
	docker build -t gustavohenrique/postgis:$(shell echo $1 | sed -e 's/-.*//g') $1
	docker build -t gustavohenrique/postgis:$(shell echo $1 | sed -e 's/-.*//g')-alpine $1/alpine
endef
$(foreach version,$(VERSIONS),$(eval $(call postgis-version,$(version))))

.PHONY: all build $(VERSIONS)
