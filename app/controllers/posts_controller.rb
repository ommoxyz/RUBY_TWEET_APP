class PostsController < ApplicationController
  # 投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 投稿詳細
  def show
    # クエリパラメータから取得した値をキーにDBからデータを取得する。
    @post = Post.find_by(id: params[:id])
  end

  # 新規投稿画面
  def new
    @post = Post.new
  end

  # 新規投稿内容保存
  def create
    # viewから渡されたcontent変数を受け取りcontentカラムに保存する。
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # 編集画面
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 編集内容保存
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # 投稿削除
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end
  end
end
