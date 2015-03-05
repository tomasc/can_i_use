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

For simple yes/no answer (considers partial support as a no):

```ruby
user_agent_string = 'Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25'

CanIUse.feature('border-radius').in?(user_agent_string) # => true
```

For detailed answer (see [all options here](https://github.com/Fyrd/caniuse/blob/master/CONTRIBUTING.md)):

```ruby
user_agent_string = 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)'

CanIUse.feature('canvas').in?(user_agent_string, as: :string) # => 'n'
```

To find out minimal version of a browser (naming matches caniuse naming: `ie`, `firefox`, `chrome`, `safari`, `opera`, `ios_saf`, `op_min`, `android`, `bb`, `op_mob`, `and_chr`, `and_ff`, `ie_mob`, `ie_mob`, `and_uc`) that fully supports certain feature:

```ruby
CanIUse.feature('canvas').from_version_of('ie') # => 10
```

## Contributing

The [caniuse](http://www.caniuse.com) are included as a submodule from the [official GitHub repo](https://github.com/fyrd/caniuse). This means this gem needs to be regularly updated to include the latest data: pull requests are welcome.

1. Fork it ( https://github.com/tomasc/can_i_use/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
