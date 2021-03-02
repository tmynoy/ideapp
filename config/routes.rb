Rails.application.routes.draw do
  root to: "ideas#index"
  resources :ideas, only: [:index, :create] do
    collection do
      get 'search'
    end
  end
end
