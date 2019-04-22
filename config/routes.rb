Rails.application.routes.draw do
  
  devise_for :admins
  resources :categories
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
 
   resources :orders do 
    resources:orderitems
  end
  
  
  devise_for :users do
  resources:orders 
end
  
 get '/checkout' => 'cart#createOrder' 
  
  get 'cart/index'
  resources :products
  resources :items
  
  
  root 'static_pages#home'
  
  get "/about", to: "static_pages#about"
  
   get '/instructions' => 'static_pages#instructions'
   
    get '/products' => 'static_pages#products'
    
     get '/contact' => 'static_pages#contact'
     
     get '/orderCompleted:id' => 'static_pages#orderCompleted'
     
     
     get '/login' => 'user#login' 
     get '/logout' => 'user#logout'
      get '/login' => 'admin#login' 
     get '/logout' => 'admin#logout'
     
     
     get '/cart/:id', to: 'cart#add'
     get '/cart', to: 'cart#index'
     get '/clearcart', to: 'cart#clearCart'
     get '/cart/remove/:id' => 'cart#remove'
     get '/cart/decrease/:id' => 'cart#decrease'

  post '/search' => 'items#search'
root :to => 'site#home'
end