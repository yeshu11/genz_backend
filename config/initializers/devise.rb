Devise.setup do |config|
  config.secret_key = ENV['SECRET_KEY_BASE']
  config.mailer_sender = 'no-reply@genzdeveloper.com'
  config.navigational_formats = ['*/*', :html, :json]
  config.sign_out_via = :delete
  config.authentication_keys = [:email]
  config.http_authenticatable = true
  config.http_authenticatable_on_xhr = true
  config.skip_session_storage = [:http_auth]
  config.allow_unconfirmed_access_for = 0.days
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
end