## About

nanoc-gunzip.rb is a [nanoc](https://github.com/nanoc/nanoc) filter that can
compress textual, and binary items in a nanoc-powered website. The filter is
particularly useful when paired with the
[gzip_static](http://nginx.org/en/docs/http/ngx_http_gzip_static_module.html)
feature of nginx, or its equivalent in other web servers. The advantage of
performing compression ahead of time is that it won't have to be performed
when a web server is serving a request.

nanoc-gunzip.rb is distributed as a RubyGem through its git repositories. See
[INSTALL](#install) for details.


## Examples

### Textual items

The following example demonstrates the compression of a textual item - a JavaScript file. <br>
For textual items, the `gzip_text` filter can be used.

```ruby
# Rules
require "nanoc-gunzip"
compile "/js/app.js" do
  write("/js/app.js")
  filter(:gzip_text)
  write("/js/app.js.gz")
end
```

### Binary items

The following example demonstratesthe compression of a binary item - a PNG file. <br>
For binary items, the `gzip_binary` filter can be used.

``` ruby
# Rules
require "nanoc-gunzip"
compile "/images/*.png" do
  write(item.identifier.to_s)
  filter(:gzip_binary)
  write("#{item.identifier}.gz")
end
```

### Options

Both the `gzip_text`, and `gzip_binary` filters accept `level`, and `strategy` options.

The `level` option represents the compression level, and it can be an integer between 0,
and 9. The default is 9 (`Zlib::BEST_COMPRESSION`).  The `strategy` options represents
the compression strategy, and it can be an interger between  0, and 4. The default is
0 (`Zlib::DEFAULT_STRATEGY`). For a complete explanation of what each integer represents,
see [the zlib manual](https://www.zlib.net/manual.html#Constants).

``` ruby
# Rules
require "nanoc-gunzip"
compile "/images/*.png" do
  write(item.identifier.to_s)
  filter(:gzip_binary, {level: X, strategy: Y})
  write("#{item.identifier}.gz")
end
```

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/nanoc-gunzip.rb)
* [Source code (GitLab)](https://gitlab.com/0x1eef/nanoc-gunzip.rb)

## <a id='install'>Install</a>

nanoc-gunzip.rb is distributed as a RubyGem through its git repositories. <br>
[GitHub](https://github.com/0x1eef/nanoc-gunzip.rb),
and
[GitLab](https://gitlab.com/0x1eef/nanoc-gunzip.rb)
are available as sources.

**Gemfile**

```ruby
gem "nanoc-gunzip.rb", github: "0x1eef/nanoc-gunzip.rb", tag: "v0.1.3"
```

## License

This project is released under the terms of the MIT license. <br>
See [./LICENSE.txt](./LICENSE.txt) for details.
