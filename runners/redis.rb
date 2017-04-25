def redis_namespace_callback
  template "#{PATH}/initializers/redis.tt", 'config/initializers/redis.rb'
end

set_gems_from_runner File.basename(__FILE__, '.*')