class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def show
        @user = User.find(params[:id])
        @user = User.includes(:stories).find(helpers.current_user.id)
        
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id #para guardar en el objeto sesion el "":user_id" es un key, y el valor es el id del usuario que se creó
                format.html { redirect_to root_path, notice: 'User was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
        #los atributos que vienen en params son los que se requieren y se permiten 
    end

end