set_gem 'exception_notification' do
  environment 'config.action_mailer.delivery_method = :smtp', env: 'production'
  environment 'config.action_mailer.perform_deliveries = true', env: 'production'
  environment 'config.action_mailer.raise_delivery_errors = true', env: 'production'

  smtp_config = { address: 'smtp.googlemail.com',
                  port: '587',
                  user_name: 'informer@agilie.com',
                  password: 'password',
                  authentication: :plain,
                  enable_starttls_auto: true }

  environment "config.action_mailer.smtp_settings = #{smtp_config}", env: 'production'
end