Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders, only: :create do
        collection do
          get '/status', to: 'orders#order_status', as: 'status'
          get '/list', to: 'orders#list', as: 'list'
        end
      end

      resources :batches do
        collection do

        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
