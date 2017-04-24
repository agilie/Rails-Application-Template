set_gem'activeadmin' do
  set_gem 'devise', parent: $config['gems']['activeadmin']
  generate('active_admin:install')
end
