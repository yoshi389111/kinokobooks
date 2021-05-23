#!/usr/bin/bash

cd $(dirname $0)/../..

function clean_copy() {
    NAME="$1"
    rm -rf ../zenn/books/$NAME
    cp -rp zenn/$NAME ../zenn/books/$NAME
}

clean_copy prog-097-org
clean_copy prog-097-jpn
clean_copy soft-097-org
clean_copy soft-097-jpn
clean_copy mngr-097-org
clean_copy mngr-097-jpn
clean_copy game-097-one
clean_copy game-097-two
