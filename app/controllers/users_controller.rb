class UsersController < ApplicationController
    
    def show
       @user = User.find(params[:id])
       @book = Book.new
       @books = @user.books
    end
    
    def edit
       @user = User.find(params[:id])
       redirect_to user_path(current_user.id) unless current_user.id == @user.id 
    end
    
    def index
       @user = current_user
       @book = Book.new
       @users = User.all
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
         redirect_to user_path(@user.id), notice:"You have updated user successfully ;)"
        else
         render :edit
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
