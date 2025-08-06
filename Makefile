# $Header$

mBuildList = \
    dist/custom-field-shortcode/readme.txt \
    dist/custom-field-shortcode/custom-field-shortcode.php

# --------------------

build : clean VERSION dist $(mBuildList)


package : dist/custom-field-shortcode.zip

clean :
	-find . -type f -name '*~' -exec rm {} \;

# --------------------

dist : dist/custom-field-shortcode

dist/custom-field-shortcode :
	mkdir -p $@

dist/custom-field-shortcode.zip : build dist
	incver.sh -m
	-rm $@
	cd dist; zip -r $@ custom-field-shortcode

dist/custom-field-shortcode/readme.txt : custom-field-shortcode/readme.txt
	sed "s/VERSION/$$(cat VERSION)/" <$? >$@

dist/custom-field-shortcode/custom-field-shortcode.php : custom-field-shortcode/custom-field-shortcode.php
	sed "s/VERSION/$$(cat VERSION)/" <$? >$@

custom-field-shortcode/readme.txt : README.md
	-cp $? $@

VERSION : custom-field-shortcode/readme.txt custom-field-shortcode/custom-field-shortcode.php
	incver.sh -p
