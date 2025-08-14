# Makefile for github.com:TurtleEngr/plugin-custom-field-shortcode

# Typical workflow
# make update - get latest version from github
# make build - incPatch, $(mProduct), check
# make save - update, incMinor, build, ci, push develop to github,
#             copy to PubDev
# make publish - incMajor, save, tag, ci, push to develop, merge to
#                main, push to main, copy to PubRel

mProj = plugin-custom-field-shortcode
mProduct = dist/custom-field-shortcode.zip

mBuildList = \
    VERSION \
    dist/custom-field-shortcode \
    dist/custom-field-shortcode/readme.txt \
    dist/custom-field-shortcode/custom-field-shortcode.php

mServer = moria.whyayh.com
mPubDev = /rel/development/software/own/$(mProj)
mPubRel = /rel/released/software/own/$(mProj)

# --------------------

build : clean
	$(MAKE) $(mProduct)
	@echo 'If OK, make save'

save : update incPatch build
	git ci -am Updated
	git push origin develop
	-ssh $(mServer) mkdir -p $(mPubDev)
	rsync -a $(mProduct) $(mServer):$(mPubDev)
	@echo 'If OK, make publish'

publish release : incMinor save 
	git tag -f -F VERSION "v$$(cat VERSION)"
	git push --tags origin develop
	git co main
	git pull --tags origin main
	git merge develop
	git push --tags origin main
	git co develop
	-ssh $(mServer) mkdir -p $(mPubRel)
	rsync -a $(mProduct) $(mServer):$(mPubRel)
	@echo 'If done, make dist-clean'

update :
	git co develop
	git pull --tags origin develop

clean :
	-find . -type f -name '*~' -exec rm {} \;

dist-clean : clean
	rm -rf dist


# To remove tags: local and remote
# git tag -d v2.1.1
# git push origin --delete v2.1.1

# --------------------

incPatch : VERSION
	incver.sh -p

incMinor : VERSION
	incver.sh -m

incMajor : VERSION
	incver.sh -M

$(mProduct) : $(mBuildList)
	-rm $@
	cd dist; zip -r custom-field-shortcode.zip custom-field-shortcode

# mBuildList

VERSION :
	echo '0.0.0' >$@

dist/custom-field-shortcode :
	mkdir -p $@

dist/custom-field-shortcode/readme.txt : VERSION custom-field-shortcode/readme.txt
	-cp custom-field-shortcode/readme.txt $@

dist/custom-field-shortcode/custom-field-shortcode.php : VERSION custom-field-shortcode/custom-field-shortcode.php
	sed "s/VERSION/$$(cat VERSION)/" <custom-field-shortcode/custom-field-shortcode.php >$@

custom-field-shortcode/readme.txt : VERSION README.md
	sed "s/VERSION/$$(cat VERSION)/" <README.md >$@
