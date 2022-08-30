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
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      image_name: "default_user.jpg"
    )

    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    canSavedImage = false
    if params[:image]
      canSavedImage = File.binwrite("public/user_images/#{@user.id}.jpg", params[:image].read)
    end

    if canSavedImage
      @user.image_name = "#{@user.id}.jpg"  
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
