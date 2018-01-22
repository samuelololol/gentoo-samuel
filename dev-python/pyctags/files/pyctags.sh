#!/bin/bash
SITE_PKG=""
while getopts ":s" opt; do
    case "$opt" in
        s)
            SITE_PKG=$(python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()')
            SITE_PKG="$SITE_PKG/*.py"
            echo "Include site-packages: "$SITE_PKG
            ;;
    esac
done


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
$(pwd) \
$SITE_PKG

# replace leading "!_TAG_*" lines
sed -i '/^\!_TAG.*/d' tags
sed -i '/^\ \ .*/d' tags
sed -i '/^\s*$/d' tags
