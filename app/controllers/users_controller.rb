class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render :new, status: :unprocessable_entity 
    end
  end
end
