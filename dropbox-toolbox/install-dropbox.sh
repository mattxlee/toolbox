#!/bin/sh
[ ! -d ~/.dropbox-dist ] && cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
[ ! -d ~/dropbox.py ] && wget -O ~/dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x ~/dropbox.py
