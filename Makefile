ZOLA_VERSION = 0.13.0

serve:
	zola serve

gh-pages:
	zola build
	git checkout gh-pages && cp -r public/* .

theme:
	cd semantic && ../node_modules/.bin/gulp build
	rm -rf static/components static/themes static/semantic*
	cp -r semantic/dist/semantic.min.* static/

bump:
	sed --in-place 's/${oldversion}/$(version)/g' content/doc/setup.md

install:
	wget -q -O - "https://github.com/getzola/zola/releases/download/v$(ZOLA_VERSION)/zola-v$(ZOLA_VERSION)-x86_64-unknown-linux-gnu.tar.gz" | tar xzf - -C $$HOME/bin
	which zole; zole --version
