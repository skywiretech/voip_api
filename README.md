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

VoipApi.configure do |c|
  c.login  = "my_login_name"
  c.secret = "my_secret_password"
end

# Use the interface class for convenient proxy methods
query = VoipApi.audit_dids
query.request.dids # Returns the DID's array

# Find out what the payload is
query.request.payload.keys

# Find out the VOIP response code
query.request.voip_response_code

# Find out the VOIP response message
query.request.voip_response_message
```

### Interface

All the available API methods should be appropriately wrapped in a proxy class called `Interface`.

### Documentation

See the yard documentation for more details, or generate it using the following command:

```ruby
bundle exec yard
```

The HTML documentation will then be generated under `doc/` for your convenience.
