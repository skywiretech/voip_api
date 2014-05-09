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

api_account = VoipApi.account

# Make a request for a DID
api = VoipApi::API::DIDRequest.new
request = api.query_did('4355551234')
response = request.parsed_response
```

### DIDs

You can query the VOIP Innovations API for information about DIDs using the following methods:

`query_did(did_number)`

This method corresponds to the VOIP Innovations API method `queryDIDs`. See the documentation for more methods.

This gem tries to correlate the API calls to a RESTful style resource pattern.
