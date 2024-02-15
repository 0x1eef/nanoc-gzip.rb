## About

nanoc-gzip.rb is a
[nanoc](https://nanoc.app)
filter that integrates gzip compression into nanoc-powered
websites. The filter can be combined with the nginx module
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
default level is 9. And the default strategy
is 0. The
[zlib manual](https://www.zlib.net/manual.html#Constants)
documents what integers are accepted and what
they represent. Example:

``` ruby
# Rules
require "nanoc-gzip"
compile "/js/app.js" do
  write("/js/app.js")
  filter(:gzip, {level: 1, strategy: 2})
  write("/js/app.js.gz")
end
```

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/nanoc-gzip.rb)
* [Source code (GitLab)](https://gitlab.com/0x1eef/nanoc-gzip.rb)

## <a id='install'>Install</a>

**Git**

nanoc-gzip.rb is distributed as a RubyGem through its git repositories. <br>
[GitHub](https://github.com/0x1eef/nanoc-gzip.rb),
and
[GitLab](https://gitlab.com/0x1eef/nanoc-gzip.rb)
are available as sources.

```ruby
# Gemfile
gem "nanoc-gzip.rb", github: "0x1eef/nanoc-gzip.rb"
```

**Rubygems.org**

nanoc-gzip.rb can also be installed via rubygems.org.

    gem install nanoc-gzip.rb

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/).
<br>
See [LICENSE](./LICENSE).
