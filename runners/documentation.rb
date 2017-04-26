def swagger_docs_callback
  template "#{TEMPLATE_PATH}/initializers/swagger_docs.tt", 'config/initializers/swagger_docs.db'
end

def swagger_engine_callback
  template "#{TEMPLATE_PATH}/initializers/swagger_engine.tt", 'config/initializers/swagger_engine.tt'
  route "mount SwaggerEngine::Engine, at: '/api-docs'"
end
