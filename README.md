jfpm
====

Run fpm with a local JRuby instead of a global Ruby install

## Features

- Run the awesome [fpm](https://github.com/jordansissel/fpm) tool without a system Ruby
- No global gem installs needed, it all stays inside this folder
- Includes release scripts to be used for Python projects to build releases

## Usage

Usage is simple, simply invoke `./fpm.sh` as if you would run [fpm](https://github.com/jordansissel/fpm).
For example, you can do `./fpm.sh --version` as a test.
All files are downloaded/stored right next to the script.
The script will automatically invoke the setup script if fpm is not installed yet:

- Downloads a [JRuby](https://github.com/jruby/jruby) zip
- Extracts it to the jruby folder
- Installs the fpm gem to the gems folder using jruby

Subsequent runs will detect the jruby and gems folders and use it to run fpm.
If you want to update or re-install at some point,
either delete the folders and run `./fpm.sh` like usual or run the setup manually.
The startup time of JRuby is a bit slower than regular ruby,
but otherwise subsequent runs should be identical to running fpm with Ruby.

## Release scripts

The release helper scripts are responsible for bundling my projects for release.
You can use them to compile any pyproject.toml project into deb, rpm and pacman.
The scripts are supposed to be run from another project like so: `../jfpm/release_py_simple.sh`.
The deps version uses PyInstaller to bundle the dependencies with it.
The resulting builds can be found in the respective repos releases tab,
as well as in my own [Fedora repo](https://jelmerro.nl/fedora) for the rpm builds to also auto update them.

## Contribute

You can support my work on [ko-fi](https://ko-fi.com/Jelmerro) or [Github sponsors](https://github.com/sponsors/Jelmerro).
Another way to help is to report issues or suggest new features.
Please try to follow recommendations by shellcheck when developing.
For an example vimrc that can auto-format based on the included linters,
you can check out my personal [vimrc](https://github.com/Jelmerro/vimrc).
