class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  private
  
  def authenticated?
    authenticate_or_request_with_http_basic { |username, password|
      User.find_by(email: username).try(:authenticate, password).present?
    }
  end
end
