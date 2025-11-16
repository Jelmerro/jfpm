jfpm
====

### Run fpm with a local JRuby install instead of a global Ruby install

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

## Rationale

This is mainly of interest for those who do not use Ruby, but do have Java.
It can also be used by those who do have Ruby but do not like to install global gems.
The main advantage in both cases is that everything related to fpm is local,
so it does not need nor use any global tools to be able to use fpm.
Fpm itself does need some global tools though, and without Java you cannot run JRuby,
but otherwise everything related to jfpm is stored next to the `./fpm.sh` script.

## License

The bash scripts of jfpm are licensed as free software under the MIT.
Both JRuby and the fpm ruby gem are covered by different licenses.
