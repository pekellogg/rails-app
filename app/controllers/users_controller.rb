require "pry"
class UsersController < ApplicationController
    before_action(:require_login, only: [:edit, :update])
    
    def home
        if logged_in?
            render(:home)
        else
            render("sessions/new")
        end
    end

    def index
        @users = User.all 
    end
    
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user = User.find_or_create_by(user_params)
        if @user.save
            log_in(@user)
            flash.now[:success] = "Welcome, #{@user.first_name}!"
            redirect_to(@user)
        else
            flash.now[:alert] = "Could not create account!"
            render(:new)
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.save
            redirect_to("/")
        else
            flash.now[:alert] = "Could not update account!"
            render(:edit)
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash.now[:notice] = "Account successfully deleted."
        redirect_to("/")
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest, identities: [])
    end
end