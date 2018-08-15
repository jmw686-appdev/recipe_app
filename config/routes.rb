Rails.application.routes.draw do
  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show" })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })

  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })

  #------------------------------

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/my_recipes', to: 'users#recipe_index'
end
