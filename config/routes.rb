Rails.application.routes.draw do
  # ホーム
  get "/" => "home#top"
  get "about" => "home#about"

  # 投稿画面
  get "posts/index" => "posts#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
