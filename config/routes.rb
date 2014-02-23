Quilt::Application.routes.draw do

  root :to => "welcome#index"

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do

  end

  get '/:user', to: 'styleguides#index', as: :user
  get '/:user', to: 'styleguides#index', as: :styleguides
  get '/:user/:styleguide', to: 'styleguides#show', as: :styleguide
  get '/:user/:styleguide/edit', to: 'styleguides#edit', as: :edit_styleguide
  get '/:user/styleguides/new', to: 'styleguides#new', as: :new_styleguide
  post '/:user', to: 'styleguides#create'
  put '/:user/:styleguide', to: 'styleguides#update'
  delete '/:user/:styleguide', to: 'styleguides#destroy'
  get '/:user/:styleguide', to: 'styleguides#show', as: :components
  get '/:user/:styleguide/:component', to: 'components#show', as: :component
  get '/:user/:styleguide/:component/edit', to: 'components#edit', as: :edit_component
  get '/:user/:styleguide/components/new', to: 'components#new', as: :new_component
  post '/:user/:styleguide', to: 'components#create'
  put '/:user/:styleguide/:component', to: 'components#update'
  delete '/:user/:styleguide/:component', to: 'components#destroy'

end

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


