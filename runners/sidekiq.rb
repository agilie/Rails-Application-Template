def sidekiq_callback
  template "#{TEMPLATE_PATH}/initializers/sidekiq.tt", 'config/initializers/sidekiq.rb'
  template "#{TEMPLATE_PATH}/ymls/sidekiq.yml", 'config/sidekiq.yml'
end

def sidekiq_cron_callback
  template "#{TEMPLATE_PATH}/initializers/sidekiq_cron.tt", 'config/initializers/sidekiq_cron.rb'
  template "#{TEMPLATE_PATH}/ymls/schedule.yml", 'config/schedule.yml'
end
