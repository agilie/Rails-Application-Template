# Rails-Application-Template
Base template for creating Ruby-on-Rails applications

## How to use
1. Download or clone the template
2. Simply use the template when you are creating your application
    ```
    rails new myapp -m /path/to/template/the_bat.rb
    ```
3. Have fun with your application

## Customization
Template uses `config.yml` file for installing and configuring rails gems and other stuff. 
Here are the main customizable features:

1. `ruby_version` - the ruby version used for the project. Will take the current if not 
specified
2. `ruby_gemset` - ruby gemset name. Will use project name if not specified
3. gems block - list of gems that can be installed to the application. The minimum 
requirement for the gem to be installed is `gem_name: true`. i.e.
    ```yaml
    gems:
      acts_as_api: true
    ```
    If you want to specify the gem version you can do that as follows
    ```yaml
    gems:
      acts_as_api:
        version: ~> 5.0.0
    ```
4. Some gems are installed together with dependencies, i.e.
   ```yaml
     sidekiq:
       version: ~> 4.2
       sidekiq-statistic: true
       sidekiq-cron: true
   ```
   Just comment out one that you don't need
      ```yaml
        sidekiq:
          version: ~> 4.2
          sidekiq-statistic: true
          # sidekiq-cron: true
      ```

## Troubleshooting
Problems? Check the [Issues](https://github.com/agilie/Rails-Application-Template/issues) block 
to find the solution or create an new issue that we will fix asap. Feel free to contribute.

## License
[MIT Licence](http://www.opensource.org/licenses/mit-license)