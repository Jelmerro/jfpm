#!/usr/bin/env bash
cd "$(dirname "$(realpath "$0")")" || exit
rm -rf gems
rm -rf jruby*
setup_url=$(curl https://api.github.com/repos/jruby/jruby/releases/latest | grep "browser_download_url" | grep ".zip" | grep "bin")
setup_url=$(echo "$setup_url" | cut -d ":" -f "2,3" | tr -d '"' | tr -d ',' | tr -d ' ')
echo "$setup_url"
wget "$setup_url" -O jruby.zip
unzip jruby.zip
rm jruby.zip
export JRUBY_HOME=$(realpath .)
export GEM_HOME=$(realpath .)/gems
./jruby-*/bin/jruby -S gem install fpm
