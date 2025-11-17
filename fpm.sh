#!/usr/bin/env bash
if type fpm >/dev/null 2>&1;then
    fpm "$@"
    exit
fi
dir=$(dirname "$(realpath "$0")")
if [ ! -d "$dir/gems/" ] || [ ! -d "$dir/jruby/" ];then
    "$dir/setup.sh"
fi
export GEM_HOME=$dir/gems/
export PATH=$PATH:${GEM_HOME}bin:$dir/jruby/bin
"$dir/jruby/bin/jruby" -S fpm "$@"
