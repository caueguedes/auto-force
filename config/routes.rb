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
          put '/:reference/produce', to: 'batches#produce', as: 'produce'
          put '/:reference/close', to: 'batches#close',  as: 'close'
        end
      end

      get '/financial', to: 'financial#report', as: 'report'
    end
  end
  # match '*a', to: 'error#routing_error  ', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
