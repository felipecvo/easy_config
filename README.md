# Easy config
Rails and Rack applications configuration made easy.

[![Build Status](https://secure.travis-ci.org/felipecvo/easy_config.png?branch=master)](http://travis-ci.org/felipecvo/easy_config)

# Installation

`gem install easy_config`

or in your Gemfile

`gem "easy_config"`

# How it works

EasyConfig allows you to access your config files easily. All you have to do is
to put your files in config dir and be a valid YAML file (with .yml as extension).

If you desire you can split your configurations by environment. Easy config treats it
automatically.

## Example

We can access database.yml file as:

`EasyConfig.database.adapter`

And if you have your our custom config file named my_customs.yml:

`EasyConfig.my_customs.custom_var`

# TODO

Support ENV['DATABASE_URL'] to EasyConfig.database.url
