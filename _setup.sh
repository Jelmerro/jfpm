#!/usr/bin/env bash
dir=$(dirname "$(realpath "$0")")
rm -rf "$dir/gems" "$dir/jruby*"
setup_url=$(curl https://api.github.com/repos/jruby/jruby/releases/latest | grep "browser_download_url" | grep ".zip" | grep "bin")
setup_url=$(echo "$setup_url" | cut -d ":" -f "2,3" | tr -d '"' | tr -d ',' | tr -d ' ')
echo "$setup_url"
wget "$setup_url" -O "$dir/jruby.zip"
unzip -o "$dir/jruby.zip" -d "$dir"
mv "$dir"/jruby-*/ "$dir/jruby/"
rm "$dir/jruby.zip"
export GEM_HOME=$dir/gems
export GEM_PATH=$dir/gems
"$dir/jruby/bin/jruby" -S jgem install fpm
