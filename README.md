## About

nanoc-gunzip.rb is a [nanoc](https://github.com/nanoc/nanoc) filter that can
compress textual, and binary items in a nanoc-powered website. The filter is
particularly useful when paired with the [gzip_static]() feature of nginx, or
its equivalent in other web servers.

The advantage of performing compression at compile time is that compression does
not have to happen at runtime when a web server serving a request - which can save
time and CPU resources.

## Examples

### Introduction

The README probably covers everything you will need to know to use nanoc-gunzip.rb. <br>
There's also [API documentation](https://0x1eef.github.io/x/nanoc-gunzip.rb) available.

### Textual items

The following example demonstrates the compression of a textual item - a JavaScript file.
For textual items, the `gzip_text` filter is used:

```ruby
# Rules
require "nanoc-gunzip"
compile "/js/app.js" do
  write("/js/app.js")
  filter :gzip_text
  write("/js/app.js.gz")
end
```

### Binary items

The following example demonstrates the compression of a binary item - a PNG file.
For binary items, the `gzip_binary` filter is used:

``` ruby
# Rules
require "nanoc-gunzip"
compile "/images/*.png" do
  write(item.identifier.to_s)
  filter :gzip_binary
  write("#{item.identifier}.gz")
end
```

### Options

Both the `gzip_text`, and `gzip_binary` filters accept `level`, and `strategy` options.

The `level` option represents the compression level, and it can be an integer between 0,
and 9. The default is 9 (`Zlib::BEST_COMPRESSION`).  The `strategy` options represents
the compression strategy, and it can be an interger between  0, and 4. The default is
0 (`Zlib::DEFAULT_STRATEGY`).

For an explanation of what these integers can mean, see
[the zlib manual](https://www.zlib.net/manual.html#Constants). The following example
demonstrates how the options can be used:

``` ruby
# Rules
require "nanoc-gunzip"
compile "/images/*.png" do
  write(item.identifier.to_s)
  filter :gzip_binary, level: X, strategy: Y
  write("#{item.identifier}.gz")
end
```

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/nanoc-gunzip.rb)
* [Source code (GitLab)](https://github.com/0x1eef/nanoc-gunzip-rb)

## Install

nanoc-gunzip.rb is available as a RubyGem:

    gem install nanoc-gunzip.rb

## License

This project is released under the terms of the MIT license. <br>
See [./LICENSE.txt](./LICENSE.txt) for details.
