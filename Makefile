#!make
JEKYLL = bundle exec jekyll
SITE = _site

default: localserve encrypt

localserve:
	${JEKYLL} serve

clean: ${SITE}
	rm -rf ${SITE}

build:
	${JEKYLL} build

encrypt:
	find ${SITE} -type f -path "*-locked*" -name "*.html" -exec npx staticrypt {} "${ENCKEY}" -o {} -r 5 -t "Members only!" \;

release: build encrypt

deploy: ${SITE}
	git push origin draft | grep "Everything up-to-date" 2> /dev/null && printf "All done!" || printf "\nNOTHING TO DEPLOY! run: git add . && git commit -S -m ''\n"

localdeploy: release ${SITE}
	sudo cp -r ${SITE}/* /var/www/html/
