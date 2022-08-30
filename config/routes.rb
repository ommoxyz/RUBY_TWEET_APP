Rails.application.routes.draw do
  get "users/index" => "users#index" # ユーザ一覧 表示
  get "users/:id" => "users#show" # ユーザ詳細 表示
  get "signup" => "users#new" # ユーザ登録 表示
  get "users/:id/edit" => "users#edit" # ユーザ編集 表示
  post "users/create" => "users#create" # ユーザ登録 実行
  post "users/:id/update" => "users#update" # ユーザ編集 実行
  
  get "/" => "home#top" # ホーム 表示
  get "about" => "home#about" # 説明 表示

  get "posts/index" => "posts#index" # 投稿一覧 表示
  get "posts/new" => "posts#new" # 新規投稿 表示
  get "posts/:id" => "posts#show" # 投稿詳細 表示
  get "posts/:id/edit" => "posts#edit" # 投稿編集 表示
  post "posts/create" => "posts#create" # 投稿登録 実行
  post "posts/:id/update" => "posts#update" # 投稿編集 実行
  post "posts/:id/destroy" => "posts#destroy" # 投稿削除 実行


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
