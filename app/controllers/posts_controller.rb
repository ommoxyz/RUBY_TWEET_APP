class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # クエリパラメータから取得した値をキーにDBからデータを取得する。
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    # viewから渡されたcontent変数を受け取りcontentカラムに保存する。
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
end
