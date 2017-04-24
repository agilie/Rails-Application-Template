set_gem 'sidekiq' do
  template "#{PATH}/initializers/sidekiq.tt", 'config/initializers/sidekiq.rb'
  template "#{PATH}/ymls/sidekiq.yml", 'config/sidekiq.yml'

  set_gem 'sidekiq-statistic', parent: $config['gems']['sidekiq']
  set_gem 'sidekiq-cron', parent: $config['gems']['sidekiq'] do
    template "#{PATH}/initializers/sidekiq_cron.tt", 'config/initializers/sidekiq_cron.rb'
    template "#{PATH}/ymls/schedule.yml", 'config/schedule.yml'
  end
end