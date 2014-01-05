.PHONY: vendor front-vendor back-vendor clean server help

help:
	@echo " clean - remove dependencies"
	@echo "vendor - install dependencies"
	@echo "server - run server in dev mode"

clean:
	@-rm -r public/vendor
	@-rm -r vendor

vendor: front-vendor back-vendor

front-vendor:
	@-rm -r public/vendor
	@cd public; bower install \
		jquery#2.0.3 \
		bootstrap#3.0.3 \
		jquery-csv
	@mv public/bower_components public/vendor

back-vendor:
	@-rm -r vendor
	@virtualenv --no-site-packages vendor
	@vendor/bin/pip install bottle==0.11.6 requests==2.1.0

server:
	@BOTTLE_DEV=1 vendor/bin/python server.py
