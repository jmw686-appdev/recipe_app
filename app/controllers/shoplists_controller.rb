class ShoplistsController < ApplicationController
  def index
    @shoplists = Shoplist.all

    render("shoplist_templates/index.html.erb")
  end

  def show
    @shoplist = Shoplist.find(params.fetch("id_to_display"))

    render("shoplist_templates/show.html.erb")
  end

  def new_form
    @recipe = Recipe.find(params.fetch('id'))
    render("shoplist_templates/new_form.html.erb")
  end

  def create_row
    @shoplist = Shoplist.new
    @ingredient = Ingredient.new
    
    @shoplist.name = params.fetch("name")
    @ingredient.name = params.fetch("i-name")
    @ingredient.amount = params.fetch("amount")
    @ingredient.units = params.fetch("units")
    @ingredient.price = params.fetch("price")
    @shoplist.sum = @ingredient.price
    @shoplist.recipe_id = params.fetch("recipe_id")
    @shoplist.user_id = params.fetch("user_id")

    if @shoplist.valid?
      @shoplist.save
      @ingredient.shoplist_id = @shoplist.id
      @ingredient.save
      redirect_to("/shoplists", :notice => "Shoplist created successfully.")
    else
      render("shoplist_templates/new_form.html.erb")
    end
  end

  def edit_form
    @shoplist = Shoplist.find(params.fetch("prefill_with_id"))

    render("shoplist_templates/edit_form.html.erb")
  end

  def update_row
    @shoplist = Shoplist.find(params.fetch("id_to_modify"))

    @shoplist.name = params.fetch("name")
    @shoplist.amount = params.fetch("amount")
    @shoplist.units = params.fetch("units")
    @shoplist.sum = params.fetch("sum")
    @shoplist.recipe_id = params.fetch("recipe_id")

    if @shoplist.valid?
      @shoplist.save

      redirect_to("/shoplists/#{@shoplist.id}", :notice => "Shoplist updated successfully.")
    else
      render("shoplist_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @shoplist = Shoplist.find(params.fetch("id_to_remove"))

    @shoplist.destroy

    redirect_to("/shoplists", :notice => "Shoplist deleted successfully.")
  end
end
