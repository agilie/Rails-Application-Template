# Rails-Application-Template
Base template for creating Ruby-on-Rails applications

## How to use
1. Download or clone the template
2. Set your ruby version and gemset
    ```bash
    $ rvm use 2.3.0@myapp --create
    ```
3. Simply use the template when you are creating your application
    ```
    rails new myapp -m /path/to/template/bootstrap.rb
    ```
4. Have fun with your application

## Customization
Template uses `config.yml` file for installing and configuring rails gems and other stuff. 
Here are the main customizable features:

1. Each block runs his own runner from runners folder. The runner will be executed if it has
   `true` value or a hash assigned, i.e.
    ```yaml
    rvm: true
    ```
    ```yaml
    serializer:
      gems:
        acts_as_api: true
    ```
2. Each block may contain a list of gems to be installed. They are put in a `gems` block, i.e.
   ```yaml
    testing:
      gems:
        faker: true
        rspec-rails:
          group: test, development
        factory_girl_rails:
          version: ~> 4.8
          group: test, development
   ```
   You can use just `true` value for a gem. In this case the gem will be added to `Gemfile` like
   ```ruby
   gem 'faker'
   ```
   You can also pass version and/or group params and they will be used in `Gemfile` either
   ```ruby
   gem 'factory_girl_rails', '~> 4.8', group: [:test, :development]
   ```
   
## Troubleshooting
Problems? Check the [Issues](https://github.com/agilie/Rails-Application-Template/issues) block 
to find the solution or create an new issue that we will fix asap. Feel free to contribute.

## License
[MIT Licence](http://www.opensource.org/licenses/mit-license)