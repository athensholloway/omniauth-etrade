# Omniauth::Etrade

This is the official OmniAuth strategy for authenticating with E*Trade's API. To use it, you'll need a consumer key and consumer secret which can be obtained from E*Trade (more information available at [developer.etrade.com](https://developer.etrade.com/))

## Installation

Add the strategy to your application's Gemfile:

```ruby
gem 'omniauth-etrade'
```

And then execute:

```ruby
bundle
```

Or install it yourself as:

```ruby
gem install omniauth-etrade
```

## Usage

Once installation is complete. Integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :etrade, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :etrade, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end
```

If using devise, you'll want to declare provider in your config\initializers\devise.rb:

```ruby
config.omniauth :etrade, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
