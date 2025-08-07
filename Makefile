# $Header$

mProj = plugin-custom-field-shortcode
mProduct = dist/custom-field-shortcode.zip

mBuildList = \
    VERSION \
    dist/custom-field-shortcode \
    dist/custom-field-shortcode/readme.txt \
    dist/custom-field-shortcode/custom-field-shortcode.php

mServer = moria.whyayh.com
mRelDev = /rel/development/software/own/$(mProj)
mRelRel = /rel/released/software/own/$(mProj)

# --------------------

build : clean incPatch
	$(MAKE) $(mProduct)

save : update incMinor build
	git ci -am Updated
	git push origin develop

publish release : incMajor save 
	git tag -f -F VERSION "v$$(cat VERSION)"
	git push --tags origin develop
	git co main
	git pull origin main
	git merge develop
	git push --tags origin main
	git co develop
	rsync -a $(mPubList) $(mServer):$(mRelRel)

update :
	git co develop
	git pull origin develop

clean :
	-find . -type f -name '*~' -exec rm {} \;

dist-clean : clean
	rm -rf dist

# --------------------

VERSION :
	echo '0.0.0' >$@

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

dist/custom-field-shortcode :
	mkdir -p $@

dist/custom-field-shortcode/readme.txt : VERSION custom-field-shortcode/readme.txt
	sed "s/VERSION/$$(cat VERSION)/" <custom-field-shortcode/readme.txt >$@

dist/custom-field-shortcode/custom-field-shortcode.php : VERSION custom-field-shortcode/custom-field-shortcode.php
	sed "s/VERSION/$$(cat VERSION)/" <custom-field-shortcode/custom-field-shortcode.php >$@

custom-field-shortcode/readme.txt : README.md
	-cp $? $@
