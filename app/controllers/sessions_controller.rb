require_relative "../helpers/users_helper.rb"
require "pry"
class SessionsController < ApplicationController
  def new
    render(:new)
  end

  def create
    # log in with 3rd party provider
    if third_party_login?
      identity = Identity.find_or_create_by(uid: auth["uid"]) do |u|
        u.name = auth["info"]["name"]
        u.email = auth["info"]["email"].downcase if auth["info"]["email"]
        u.image = auth["info"]["image"]
        u.provider = auth["provider"]
      end

      # associate to native user if exists via email
      if user = UsersHelper.user_with_email(identity.email)
        user.identities << identity if !user.identities.include?(identity)
        log_in(user)
        flash.now[:notice] = "Welcome, #{user.first_name}!"
        redirect_to(user)

      # create native user & associate if not exists
      else 
        new_user = User.new(first_name: identity.name, identities: [identity])
        new_user.save(validate: false)
        log_in(new_user)
        flash.now[:notice] = "Welcome, #{new_user.first_name}!"
        redirect_to(new_user)
      end

    # native log in within app
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password]) 
        log_in(user)
        flash.now[:notice] = "Welcome back, #{user.first_name}!"
        redirect_to(user)
      else
        flash.now[:danger] = "Invalid email/password combination!"
        redirect_to(:new)
      end
    end
  end

  def destroy
    log_out
    redirect_to("/")
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end