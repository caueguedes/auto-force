Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders, only: :create do
        collection do
          get '/status', to: 'orders#check_status', as: 'status'
          get '/:purchase_channel/list', to: 'orders#list', as: 'list'
        end
      end

      resources :batches, only: :create do
        collection do
          put '/:reference/produce', to: 'batches#produce'
          put '/:reference/close', to: 'batches#close'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
