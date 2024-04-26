#!/usr/bin/env bash
dir=$(dirname "$(realpath "$0")")
if [ ! -d $dir/gems/ ] || [ ! -d $dir/jruby-*/ ];then
    "$dir/setup.sh"
fi
export JRUBY_HOME=$dir
export GEM_HOME=$dir/gems/
export GEM_PATH=$dir/gems/
export PATH=$PATH:$GEM_HOME/bin
$dir/jruby-*/bin/jruby -S fpm "$@"
