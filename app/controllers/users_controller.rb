class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    
  end
  
  def index
    @newbook = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
  
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
       redirect_to user_path(current_user)
      end
    end
  
end
