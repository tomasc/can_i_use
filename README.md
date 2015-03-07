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

```ruby
CanIUse.feature('border-radius').supported_in?(user_agent_string)
CanIUse.feature('border-radius').almost_supported_in?(user_agent_string)
CanIUse.feature('border-radius').fully_supported_in?(user_agent_string)
```

To find out minimal version of a browser (naming matches caniuse naming: `ie`, `firefox`, `chrome`, `safari`, `opera`, `ios_saf`, `op_min`, `android`, `bb`, `op_mob`, `and_chr`, `and_ff`, `ie_mob`, `ie_mob`, `and_uc`) that fully supports certain feature:

```ruby
CanIUse.feature('canvas').in_browser('ie').supported_in_versions # => […]
CanIUse.feature('canvas').in_browser('ie').almost_supported_in_versions # => […]
CanIUse.feature('canvas').in_browser('ie').fully_supported_in_versions # => []

CanIuse.feature('canvas').in_browser('ie').supported_from_version # => CanIUse::BrowserVersion
CanIuse.feature('canvas').in_browser('ie').almost_supported_from_version # => CanIUse::BrowserVersion
CanIuse.feature('canvas').in_browser('ie').fully_from_version # => CanIUse::BrowserVersion
```

## Contributing

The [caniuse](http://www.caniuse.com) are included as a submodule from the [official GitHub repo](https://github.com/fyrd/caniuse). This means this gem needs to be regularly updated to include the latest data: pull requests are welcome.

1. Fork it ( https://github.com/tomasc/can_i_use/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
