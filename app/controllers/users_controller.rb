class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Welcome to where."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # ...
    else
      flash[:alert] = "Summin' ain't right!"
      render 'edit'
    end
  end
      

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
