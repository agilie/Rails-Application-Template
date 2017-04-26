def exception_notification_callback
  gsub_file 'config/environments/production.rb', '# config.action_mailer.raise_delivery_errors = false' do
    <<-RUBY

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
                                          address: 'smtp.googlemail.com',
                                          port: '587',
                                          user_name: 'informer@agilie.com',
                                          password: 'password',
                                          authentication: :plain,
                                          enable_starttls_auto: true 
                                        }

    RUBY
  end
end
