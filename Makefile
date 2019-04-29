all: install build 

install:
	sudo gem install bundler
	bundle install

build: 
	bundle exec jekyll build
	
serve:
	JEKYLL_ENV=development bundle exec jekyll serve --unpublished --port 4010

deploy:
	git add -A .
	git commit -m "pre-deploy commit" || echo "nothing to commit"
	git push origin `git subtree split --prefix _site development`:refs/heads/master --force
