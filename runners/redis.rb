def redis_namespace_callback
  template "#{PATH}/initializers/redis.tt", 'config/initializers/redis.rb'
end