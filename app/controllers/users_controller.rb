class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]

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
      password: params[:password],
      image_name: "default_user.jpg"
    )

    if @user.save
      session[:user_id] = @user.id
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

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
