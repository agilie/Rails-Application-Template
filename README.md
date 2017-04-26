# Rails-Application-Template
Base template for creating Ruby-on-Rails applications

**Current version:** *0.1.2*

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
The list of statements that will help you to customize your own template are given below.
1. The configuration file consists of several blocks like. They divide the application generation
   process into some logic parts.
   ```yaml
   rvm: ...
   testing: ...
   documentation: ...
   deploy: ...
   ```
2. The main part of each block is `gems`. So if you want more gems to be added to your project just
   add a new block with any name, which suits your aim with appropriate `gems` block or add your `gems` to 
   any existing block.  
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
3. Each block can run his own runner from runners folder if one exists. There you can put any
   code you want to execute, i.e.
   ```ruby
   create_file '.ruby-version', RUBY_VERSION
   create_file '.ruby-gemset', app_name
   file '.rvmrc', "rvm use #{RUBY_VERSION}@#{app_name}"
   ```
4. If you need to make some actions after gem is added, i.e. run `rails generate rspec:install` you can put
   callback to the runner that will be executed after gem is added. By convention callback name depends on
   gem name and should look like this
   ```ruby
   "#{your_gem_name.gsub('-', '_')}_callback"
   ```
   So, for rspec-rails the full configuration will look like that
   ```yaml
   # config.yml
   testing:
     gems:
       rspec-rails:
         group: test, development
   ```
   ```ruby
   # runners/testing.rb
   def rspec_rails_callback
     generate('rspec:install')
   end
   ```
   
## TODOs
1. ~~Add gitignore with appropriate file exclusions~~
2. Implement a convenient way for user logins and passwords injecting to initializers
3. Add more configurations to capistrano

## Troubleshooting
Problems? Check the [Issues](issues) block 
to find the solution or create an new issue that we will fix asap. Feel free to contribute.

## License
[MIT Licence](http://www.opensource.org/licenses/mit-license)