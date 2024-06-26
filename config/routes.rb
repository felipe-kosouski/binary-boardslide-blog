Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "blog_posts#index"

  namespace :admin do
    root "blog_posts#index"
    resources :blog_posts, path: "posts" do
      resources :cover_images, only: [:destroy]
    end
  end

  resources :blog_posts, path: "posts", only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
