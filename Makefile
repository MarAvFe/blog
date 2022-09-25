default: localserve

build:
	bundle exec jekyll build

localserve:
	bundle exec jekyll serve

clean:
	rm -rf _site

deploy: _site
	git push origin draft | grep "Everything up-to-date" 2> /dev/null || printf "\nNOTHING TO DEPLOY! run: git add . && git commit -S -m ''\n"