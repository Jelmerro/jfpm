#!/usr/bin/env bash
dir=$(dirname "$(realpath "$0")")
sed -i -e 's/args = \["rpmbuild", "-bb"\]/args = \["rpmbuild", "-bb", "--buildroot", "#{build_path}\/BUILD"\]/g' $dir/gems/gems/fpm-*/lib/fpm/package/rpm.rb
