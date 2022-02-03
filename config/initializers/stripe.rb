Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY'],
  :admin_user => ENV['ADMIN_VAL_USER'],
  :admin_password      => ENV['ADMIN_VAL_PASS']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
