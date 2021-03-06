Rails.application.routes.draw do

  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/login' => 'sessions#new', :as => 'login'
  get '/upload' => 'songs#upload', :as => 'upload'
  get '/users', to: redirect('signup')
  get '/sessions', to: redirect('login')
  get '/songs', to: redirect('upload')
  get '/signup' => 'users#new', :as => 'signup'
  get '/player' => 'songs#player'
  post '/delete/playlist' => 'playlists#delete'
  post '/delete/song' => 'songs#delete'
  post '/delete/songinplaylist' => 'playlists#deleteinplaylist'
  get '/playlists' => 'playlists#playlists'
  post '/playlists/add' => 'playlists#add'
  get '/playlist/:name', to: 'playlists#playlist'
  root :to => 'songs#player'
  resources :users
  resources :sessions
  resources :songs
  resources :playlists
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
