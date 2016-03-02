# CanIUse

[![Build Status](https://travis-ci.org/tomasc/can_i_use.svg)](https://travis-ci.org/tomasc/can_i_use) [![Gem Version](https://badge.fury.io/rb/can_i_use.svg)](http://badge.fury.io/rb/can_i_use) [![Coverage Status](https://img.shields.io/coveralls/tomasc/can_i_use.svg)](https://coveralls.io/r/tomasc/can_i_use)

Very light Ruby wrapper on [caniuse](http://www.caniuse.com) data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'can_i_use'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install can_i_use
```

## Usage

Test user agent for support of a feature. Optionally specify minimal required type of support (`:almost`, `:polyfill`, `:prefix` or `:disabled`).

```ruby
CanIUse::UserAgent.new(user_agent_string).supports?('canvas') # => true
CanIUse::UserAgent.new(user_agent_string).supports?('canvas', :polyfill) # => true
```

The [caniuse](http://www.caniuse.com) data are included as a submodule from the [official GitHub repo](https://github.com/fyrd/caniuse). This means this gem needs to be regularly updated in order to reflect the latest features and their implementation in browsers by running (for example) `git submodule foreach git pull origin master`. Pull requests are welcome.

```ruby
CanIUse.updated_at # => 2016-02-29 07:20:20 UTC
```

## Contributing

1. Fork it ( https://github.com/tomasc/can_i_use/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
