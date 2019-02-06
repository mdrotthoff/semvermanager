

help:
	@echo "Pick a release type by looking at the Makefile"

patch:
	./bin/semvergen --bump patch --filename setup.py
	./bin/semvergen --bump patch --filename --label release docs/conf.py

minor:
	./bin/semvergen --bump minor --filename setup.py
	./bin/semvergen --bump minor --filename --label release docs/conf.py

major:
	./bin/semvergen --bump major --filename setup.py
	./bin/semvergen --bump major --filename --label release docs/conf.py

tag:
	./bin/semvergen --bump tag --filename setup.py
	./bin/semvergen --bump tag --filename --label release docs/conf.py

tag_version:
	python3 semvermanager/semvermgr.py --bump tag_version setup.py
	python3 semvermanager/semvermgr.py --bump tag_version --label release docs/conf.py

	
test:
	python3 setup.py test

push:
	git add -u
	git commit -m"WIP"
	git push

release: test
	git add -u
	git commit -m"Checkin for release to pypi"
	python3 setup.py upload
