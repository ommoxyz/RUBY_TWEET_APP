Rails.application.routes.draw do
  get "users/index" => "users#index" # ユーザ一覧
  get "users/:id" => "users#show" # ユーザ詳細
  get "/signup" => "users#new" # ユーザ登録情報入力
  post "users/create" => "users#create" # ユーザ登録実行
  
  get "/" => "home#top" # ホーム
  get "about" => "home#about" # 説明

  get "posts/index" => "posts#index" # 投稿一覧
  get "posts/new" => "posts#new" # 新規投稿
  get "posts/:id" => "posts#show" # 投稿詳細
  get "posts/:id/edit" => "posts#edit" # 投稿編集
  post "posts/create" => "posts#create" # 投稿登録
  post "posts/:id/update" => "posts#update" # 投稿編集
  post "posts/:id/destroy" => "posts#destroy" # 投稿削除


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
