Rails.application.routes.draw do
  # Routes for the Shoplist resource:

  # CREATE
  get("/shoplists/new/:id", { :controller => "shoplists", :action => "new_form", :as => 'shoplists_new'})
  post("/create_shoplist", { :controller => "shoplists", :action => "create_row" })

  # READ
  get("/shoplists", { :controller => "shoplists", :action => "index" })
  get("/shoplists/:id_to_display", { :controller => "shoplists", :action => "show", :as => 'shoplist' })

  # UPDATE
  get("/shoplists/:prefill_with_id/edit", { :controller => "shoplists", :action => "edit_form" })
  post("/update_shoplist/:id_to_modify", { :controller => "shoplists", :action => "update_row", :as => 'update_shoplist' })

  # DELETE
  get("/delete_shoplist/:id_to_remove", { :controller => "shoplists", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show", :as => 'recipe' })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })

  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })
  # Routes for the Ingredient resource:

  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show", :as => 'ingredient' })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients",
      :action => "edit_form", :as => 'edit_ingredient' })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row", :as => 'delete_ingredient' })

  #------------------------------

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/my_recipes', to: 'users#recipe_index'
end
