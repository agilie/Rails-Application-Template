gem 'redis', '~>3.2'
gem 'redis-namespace', '~> 1.5.2'

template "#{PATH}/initializers/redis.tt", 'config/initializers/redis.rb'