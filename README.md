## VOIP API

VOIP API is a Ruby gem for communicating with the VOIP Innovations API.

### Installation

```ruby
gem 'voip_api', git: 'git@github.com:mark-d-holmberg/voip_api.git'
```

### Configuration

VOIP API comes with a handy generator for creating the configuration initializer. Simply invoke:

```ruby
rails g voip_api:config
```

This will copy the default initialization file for VOIP API into your applications `config/initializers` directory
where you can customize the settings.


### Building the Gem

```sh
gem uninstall voip_api; rm voip_api-0.0.1.gem; gem build voip_api.gemspec; gem install voip_api;
```

then:

```sh
irb
```

```ruby
require 'voip_api'
api_account = VoipApi.account

# Make a request
api_account.request(web_method, params={})
```
