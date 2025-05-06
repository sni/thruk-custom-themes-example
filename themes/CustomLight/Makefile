SHELL=/bin/bash
NAME=$(shell basename $$(realpath .))
N_PREFIX=$(shell pwd)/node_modules
NODEVERSION=16

.PHONY: Thruk

build: dest/$(NAME)

dest/$(NAME): stylesheets/$(NAME).css
	mkdir -p dest/$(NAME)
	cp -rp stylesheets dest/$(NAME)/
	cp -rp images dest/$(NAME)/

stylesheets/$(NAME).css: Thruk node_modules src/theme.css
	mkdir -p stylesheets
	NODE_ENV=production \
	N_PREFIX=$(N_PREFIX) \
		./node_modules/.bin/n exec $(NODEVERSION) \
		npx tailwindcss -o stylesheets/${NAME}.css --input ./src/theme.css --postcss ./postcss.config.js --minify
	touch stylesheets/${NAME}.css

dev: Thruk node_modules
	mkdir -p stylesheets
	NODE_ENV=dev \
	N_PREFIX=$(N_PREFIX) \
		./node_modules/.bin/n exec $(NODEVERSION) \
		npx tailwindcss -o stylesheets/${NAME}.css --input ./src/theme.css --postcss ./postcss.config.js

watch: Thruk node_modules
	mkdir -p stylesheets
	NODE_ENV=dev \
	N_PREFIX=$(N_PREFIX) \
		./node_modules/.bin/n exec $(NODEVERSION) \
		npx tailwindcss -o stylesheets/${NAME}.css --input ./src/theme.css --postcss ./postcss.config.js --watch

Thruk:
	test -e Thruk || git clone https://github.com/sni/Thruk.git
	test -h Thruk || ( cd Thruk && git pull )
	ln -fns $$(realpath Thruk/themes/base.css) base.css

node: node_modules/.bin/n

node_modules/.bin/n:
	npm install n
	N_PREFIX=$(N_PREFIX) \
		./node_modules/.bin/n $(NODEVERSION)

node_modules: node
	N_PREFIX=$(N_PREFIX) \
		./node_modules/.bin/n exec $(NODEVERSION) npm i -D --no-audit --no-fund --prefix=$(shell pwd)/.
	# sometimes .bin dissapears after installing modules
	test -e ./node_modules/.bin/n || $(MAKE) node

clean:
	rm -rf \
		node \
		node_modules \
		package-lock.json \
		stylesheets \
		base.css \
		dest
	test -h Thruk || rm -rf Thruk
