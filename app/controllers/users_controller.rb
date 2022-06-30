require "pry"
class UsersController < ApplicationController
    before_action(:require_login, only: [:edit, :update])
    
    def show
        @user = User.find(params[:id]) if params[:id]
        if logged_in?
            render(:show)
        else
            redirect_to("/login")
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            flash.now[:success] = "Welcome, #{@user.first_name}!"
            redirect_to(user_path(@user))
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
            flash.now[:notice] = "Successfully updated account details."
            redirect_to(:show)
        else
            flash.now[:alert] = "Could not update account details!"
            redirect_to :edit
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
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, identities: [])
    end
end