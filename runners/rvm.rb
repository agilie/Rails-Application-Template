require 'rvm'

create_file '.ruby-version', RUBY_VERSION
create_file '.ruby-gemset', app_name
file '.rvmrc', "rvm use #{RUBY_VERSION}@#{app_name}"
run "rvm rvmrc trust #{app_path}"

RVM.use_from_path! app_path

unless run 'bundle --version'
  run 'gem install bundler --no-rdoc --no-ri'
end

run_bundle
