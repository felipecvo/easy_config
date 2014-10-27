# Easy config

[![Gem Version](https://badge.fury.io/rb/easy_config.svg)](http://badge.fury.io/rb/easy_config)
[![Build Status](https://secure.travis-ci.org/felipecvo/easy_config.png?branch=master)](http://travis-ci.org/felipecvo/easy\_config)
[![Code Climate](https://codeclimate.com/github/felipecvo/easy_config/badges/gpa.svg)](https://codeclimate.com/github/felipecvo/easy_config)
[![Test Coverage](https://codeclimate.com/github/felipecvo/easy_config/badges/coverage.svg)](https://codeclimate.com/github/felipecvo/easy_config)
[![Dependency Status](https://gemnasium.com/felipecvo/easy_config.svg)](https://gemnasium.com/felipecvo/easy_config)

Rails and Rack applications configuration made easy.

## Install

`gem install easy_config`

or in your Gemfile

`gem "easy_config"`

## Usage

### Rails/Sinatra
Inside config dir, create a file redis.yml:
```
development:
  host: 127.0.0.1
  port: 6379
  password:
production:
  host: 172.0.0.1
  port: 6379
  password: "alpha"
```

In your ruby code, you do:
```ruby
  Redis.current = Redis.new({
    host: EasyConfig.redis.host,
    port: EasyConfig.redis.port,
    password: EasyConfig.redis.password
  })
```

### Custom config paths

You can provide additional custom config paths.

Config file at `vendor/config/sample.yml`:
```
development:
  property: "value"
```
Code:
```
  EasyConfig.append_config_path Rails.root.join('vendor/config')
  puts EasyConfig.sample.property
```
Output will be: "value"

### Environment Variables
```
  # ENV['APP_API_KEY'] = '1234567890'
  puts EasyConfig.app.api_key
```

## How it works

EasyConfig allows you to access your config files easily. All you have to do is
to put your files in config dir and be a valid YAML file (with .yml as extension).

If you desire you can split your configurations by environment. Easy config treats it
automatically.

## Supported rubies

* 2.1
* 2.0
* 1.9.3
* ree (will be dropped after 1.0)

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2012-2014 Felipe Oliveira <[http://felipecvo.github.io/](http://felipecvo.github.io/)>
