#!/bin/bash
SITE_PKG=$(python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()')

if [ ! -f ~/.ctagsignore ]; then
    echo ".git
*.pyc
*.js
test" > ~/.ctagsignore
fi

rm -rf ./tags
ctags \
-R \
-h ".py" \
--language-force=Python \
--fields-Python=+{decorators} \
--kinds-python=+v \
--exclude=@$HOME/.ctagsignore \
--extra=+q \
$SITE_PKG \
$@
# replace leading "!_TAG_*" lines
sed -i '/^\!_TAG.*/d' tags
