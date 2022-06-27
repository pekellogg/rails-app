class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery(with: :exception)
    include SessionsHelper
    helper_method(:current_user)
end