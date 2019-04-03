# KanaRow

Detect Kana row.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kana_row'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kana_row

## Usage

```ruby
'い'.kana_row # => あ
'ク'.kana_row # => カ
'ｾ'.kana_row # => サ

# returns first charcter's kana row
'とな'.kana_row # => た
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ichi/kana_row.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
