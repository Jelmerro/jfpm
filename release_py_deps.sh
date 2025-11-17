#!/usr/bin/env bash
dir=$(dirname "$(realpath "$0")")
source "$dir/_py_to_binary.sh"
for rel in "rpm" "deb" "pacman"; do
    SOURCE_DATE_EPOCH=$timestamp "$dir/fpm.sh" -s dir -t $rel \
        --source-date-epoch-default=$timestamp --rpm-rpmbuild-define "_buildhost HOST" \
        --rpm-rpmbuild-define "_buildtime $timestamp" \
        --package "dist/$name-$version.any.$rel" \
        --name "$name" --license "$license" --version "$version" --url "$url" \
        --architecture native --description "$description" \
        --maintainer "$author" "dist/$name=/usr/bin/$name"
done
