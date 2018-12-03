Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: "api/auth/registrations"
    }
    resources :tasks, only: %i[index create destroy update show]
  end
end
