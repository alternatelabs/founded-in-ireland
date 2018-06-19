Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  namespace :admin do
    get "/", to: redirect("/admin/startups")

    resources :startups, :pages, :posts

    get "homepage" => "homepage#index", as: :homepage_edit
    post "homepage" => "homepage#update"
  end

  get "/blog" => "posts#index"
  get "/blog/:slug" => "posts#show", as: :blog_post
  get ":slug" => "pages#show"
end
