module HttpAuthConcern  
    extend ActiveSupport::Concern
    included do
        before_action :http_authenticate
    end
    def http_authenticate
        return true unless Rails.env == 'production'
        authenticate_or_request_with_http_basic do |username, password|
            username == ENV['ADMIN_VAL_USER'] && password == ENV['ADMIN_VAL_PASS']
        end
    end
end