Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, { format: "json" } do
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: "api/auth/registrations", format: :json
    }
    resources :users, only: %i[show] do
      resources :tasks, only: %i[index create destroy update show]
    end

    resources :groups, only: %i[show create update destroy] do
      resources :tasks, only: %i[index create destroy update show]
      resources :teams, only: %i[index create destroy update show]
    end
  end
end
