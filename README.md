# BitfieldFlags

Quickly add bitfield scopes to an active record model

## Installation

Add this line to your application's Gemfile:

    gem 'bitfield_flags'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitfield_flags

## Usage

```ruby
class User < ActiveRecord::Base
  include BitfieldFlags
  
  scoped_flags %w(
    is_admin
    is_customer_service
    legacy_user    
  )
  
  # ...snip...
end

User.is_admin #=> Returns all users with the 'is_admin' bitfield turned on

user = User.first
user.is_admin? #=> true or false depending on the is_admin bitfield state
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
