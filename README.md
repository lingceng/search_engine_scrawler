# SearchEngineScrawler

Collect info through a search engine.

First search related keywords for your given keyword, then collect all site for
every related keywords.

## Installation

```ruby
gem 'search_engine_scrawler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install search_engine_scrawler

## Usage

    $ rake fetch[keyword,max]

eg. search 'ruby' keyword and set the max related keywords to 20

    $ rake fetch[ruby,20]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/search_engine_scrawler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
