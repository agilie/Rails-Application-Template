def activeadmin_callback
  generate('active_admin:install')
end

set_gems_from_runner File.basename(__FILE__, '.*')
