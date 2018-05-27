# Sinceable

A tiny gem that adds two simple scopes (`since` and `until`) to all of your ActiveRecord models for finding records by timestamp.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinceable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinceable

## Usage

The tiny `sinceable` gem adds the following two scopes to `ActiveRecord::Base`, making them available in all your models. (That's all it does!)

```ruby
scope :since, ->(time, column = :created_at) { where(arel_table[column].gteq(time)) }
scope :until, ->(time, column = :created_at) { where(arel_table[column].lt(time)) }
```

This allows you to perform queries such as these:

```ruby
Order.since(3.days.ago) # orders with `created_at` within the last 3 days
User.until(Date.today, :confirmed_at) # users where `confirmed_at` is before today
```

**Note:** The `since` scope is inclusive of the timestamp (`>=`) queried, whereas the `until` scope is exclusive of the timestamp (`<`) queried. This most likely follows intent, as if you want records "since" 3:00 pm, you likely mean to include those created at exactly 3:00 pm, whereas if you want the records "until" 3 pm, you likely mean to exclude any records created "since" 3:00 pm, for example.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/diophore/sinceable.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
