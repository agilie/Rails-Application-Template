# The Base Application Template
require 'yaml'
require 'rvm'

PATH = File.expand_path File.dirname(__FILE__).freeze

$config = YAML.load_file("#{PATH}/config.yml")
GEM_SET = $config['ruby_gemset'] || app_name
RUBY_VER = $config['ruby_version'] || RUBY_VERSION

template "#{PATH}/templates/ruby-version.tt", '.ruby-version'
template "#{PATH}/templates/ruby-gemset.tt", '.ruby-gemset'

file '.rvmrc', "rvm use #{RUBY_VER}@#{GEM_SET}"
run "rvm rvmrc trust #{app_path}"

def set_gem(gem_name, options = {})
  params = {
    parent: $config['gems'],
  }.merge(options)

  if params[:parent][gem_name]
    version = params[:parent][gem_name].try(:[], 'version')
    if params[:group]
      gem gem_name, version, group: params[:group]
    else
      gem gem_name, version
    end

    yield if block_given?
  end

end
apply "#{PATH}/runners/rspec.rb" if $config['gems']['rspec-rails']

set_gem 'acts_as_api'
set_gem 'paperclip'

apply "#{PATH}/runners/activeadmin.rb" if $config['gems']['activeadmin']
apply "#{PATH}/runners/swagger.rb" if $config['gems']['swagger']
apply "#{PATH}/runners/redis.rb" if $config['gems']['redis']
apply "#{PATH}/runners/exception_notifier.rb" if $config['gems']['exception_notification']
apply "#{PATH}/runners/sidekiq.rb" if $config['gems']['sidekiq']

def run_bundle
end
