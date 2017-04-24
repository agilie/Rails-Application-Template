set_gem 'rspec-rails', group: [:test, :development] do
  generate('rspec:install')
  set_gem 'factory_girl_rails', parent: $config['gems']['rspec-rails'], group: [:test, :development] do
    template "#{PATH}/initializers/factory_girl.tt", 'spec/support/factory_girl.rb'
    inject_into_file 'spec/rails_helper.rb', "\nrequire 'support/factory_girl'", :after => "require 'rspec/rails'"

  end
end