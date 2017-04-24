gem 'swagger-docs'
gem 'swagger_engine'

template "#{PATH}/initializers/swagger.tt", 'config/initializers/swagger.rb'
route "mount SwaggerEngine::Engine, at: '/api-docs'"