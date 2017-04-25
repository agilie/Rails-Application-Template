def rspec_rails_callback
  generate('rspec:install')
end

def factory_girl_rails_callback
  template "#{TEMPLATE_PATH}/initializers/factory_girl.tt", 'spec/support/factory_girl.rb'
  inject_into_file 'spec/rails_helper.rb', "\nrequire 'support/factory_girl'", :after => "require 'rspec/rails'"
end

def simplecov_callback
  inject_into_file 'spec/spec_helper.rb', before: 'RSpec.configure' do
    <<-RUBY
      require 'simplecov'
      SimpleCov.start
    RUBY
  end
end

set_gems_from_runner File.basename(__FILE__, '.*')