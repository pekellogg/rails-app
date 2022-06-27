module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user ? true : false
    end

    def require_login
        if !logged_in?
          flash[:alert] = "Please log in!"
          redirect_to("sessions/new")
        end
    end

    def third_party_login?
        auth["uid"] if auth
    end
end