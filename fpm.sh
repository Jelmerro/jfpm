#!/usr/bin/env bash
cd "$(dirname "$(realpath "$0")")" || exit
if [ ! -d ./gems/ ] || [ ! -d ./jruby-*/ ];then
    ./setup.sh
fi
cd ./gems/ || exit
../jruby-*/bin/jruby -S fpm "$@"
