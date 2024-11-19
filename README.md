## About

nanoc-gzip.rb is a
[nanoc](https://nanoc.app)
filter that integrates gzip into nanoc.
The filter can be combined with the nginx module
[gzip_static](http://nginx.org/en/docs/http/ngx_http_gzip_static_module.html)
or its equivalent in other web servers.

## Examples

**Defaults**

The following example demonstrates the compression of "app.js".
The uncompressed version (app.js) and the compressed version
(app.js.gz) are both written to disk:

```ruby
# Rules
require "nanoc-gzip"
compile "/js/app.js" do
  write("/js/app.js")
  filter(:gzip)
  write("/js/app.js.gz")
end
```

**Options**

The filter can be configured with "level", and
"strategy" options. Both are integer values. The
default compression level is `Zlib::BEST_COMPRESSION`. 
And the default strategy is `Zlib::DEFAULT_STRATEGY`. The
[zlib manual](https://www.zlib.net/manual.html#Constants)
documents what integers are accepted and what
they represent. For example:

``` ruby
# Rules
require "nanoc-gzip"
compile "/js/app.js" do
  write("/js/app.js")
  filter(:gzip, {level: Zlib::BEST_SPEED, strategy: Zlib::HUFFMAN_ONLY})
  write("/js/app.js.gz")
end
```

## Install

**Rubygems.org**

nanoc-gzip.rb can be installed via rubygems.org:

    gem install nanoc-gzip.rb

## Sources

* [GitHub](https://github.com/0x1eef/nanoc-gzip.rb#readme)
* [GitLab](https://gitlab.com/0x1eef/nanoc-gzip.rb#about)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/)
<br>
See [LICENSE](./LICENSE)
