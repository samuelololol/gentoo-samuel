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

if [ -f tags ]; then
    if [ $2 = "-f" ]; then
        printf "Remove previous tag file\n"
        rm -rf tags
        printf "tags are removed\n"
    else
        # remove previous
        if [ -n "$ZSH_VERSION"  ]; then
            printf "Would you like to remove previous tag file"
            read -r " ? [Y/N]" response
        else
            read -r -p " Would you like to remove previous tag file? [Y/N]" response
        fi

        # removing old tags
        case "$response" in
            [yY][eE][sS]|[yY])
                rm -rf tags
                printf "tags are removed\n"
                ;;
            *)
                printf "tags are keeped\n"
                ;;
        esac
    fi
fi


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
