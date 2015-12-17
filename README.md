# Para::Acl

This [Para](https://github.com/para-cms/para/) plugin adds a simple admin roles
management system which allows you to change which kind of admins have access
to which components.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'para-acl', github: 'para-cms/para-acl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install para-acl

## Usage

Use the install generator to copy the migrations, create the super admin role.

_Note : the generator needs to update the database schema and insert data in
your database to make all existing admins have the defaul Super Admin role.
So migrations will be copied and automatically run._

    $ rails g para:acl:install

Add the plugin to your `config/initializers/para.rb` file :

```ruby
config.plugins += [:acl]
```

Add a `:acl_roles` component in your `config/components.rb` :

```ruby
component :acl, :acl_roles
```

Restart your server and access your new "Acl" component to manage roles and
authorizations.

### Disable authorization to debug or fix an error

You can disable the whole authorization system and allow for anybody to
access any component by configuring the following setting in your `config/initializers/para.rb` :

```ruby
config.acl.bypass_admin_authorization = true
```

## Contributing

1. Fork it ( https://github.com/para-cms/para-acl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
