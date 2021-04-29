class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logeado correctamente'
        else
            flash.now[:notice] = 'Email o password inválido'
            render action: :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: 'Signed out successfully'
    end
end