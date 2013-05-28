ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.mailgun.org',
  port: 587,
  domain: 'gameslist.mailgun.org',
  user_name: ENV['MAILGUN_USERNAME'],
  password: ENV['MAILGUN_PASSWORD'],
  authentication: :plain,
  enable_starttls_auto: true
}
