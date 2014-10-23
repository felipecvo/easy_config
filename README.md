# Easy config
Rails and Rack applications configuration made easy.

[![Build Status](https://secure.travis-ci.org/felipecvo/easy_config.png?branch=master)](http://travis-ci.org/felipecvo/easy\_config)
[![Code Climate](https://codeclimate.com/github/felipecvo/easy_config/badges/gpa.svg)](https://codeclimate.com/github/felipecvo/easy_config)
[![Test Coverage](https://codeclimate.com/github/felipecvo/easy_config/badges/coverage.svg)](https://codeclimate.com/github/felipecvo/easy_config)

## Installation

[![Gem Version](https://badge.fury.io/rb/easy_config.svg)](http://badge.fury.io/rb/easy_config)

`gem install easy_config`

or in your Gemfile

`gem "easy_config"`

See [Changelog](CHANGELOG.md).

## How it works

EasyConfig allows you to access your config files easily. All you have to do is
to put your files in config dir and be a valid YAML file (with .yml as extension).

If you desire you can split your configurations by environment. Easy config treats it
automatically.

### Example

We can access database.yml file as:

`EasyConfig.database.adapter`

And if you have your our custom config file named my\_customs.yml:

`EasyConfig.my_customs.custom_var`

## Supported rubies

* 2.1
* 2.0
* 1.9.3
* ree

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2012-2014 Felipe Oliveira <[http://felipecvo.github.io/](http://felipecvo.github.io/)>
