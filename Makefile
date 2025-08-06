# $Header$

# --------------------

build : clean VERSION custom-field-shortcode/readme.txt

package : dist/custom-field-shortcode.zip

clean :
	-find . -type f -name '*~' -exec rm {} \;

# --------------------

dist :
	mkdir -p $@

dist/custom-field-shortcode.zip : build dist
	incver.sh -m
	zip -r $@ custom-field-shortcode

custom-field-shortcode/readme.txt : README.md
	-cp $? $@

VERSION : custom-field-shortcode/readme.txt custom-field-shortcode/custom-field-shortcode.php
	incver.sh -p
