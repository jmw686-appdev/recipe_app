class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all

    render("ingredients/index.html.erb")
  end

  def show
    @ingredient = Ingredient.find(params.fetch("id_to_display"))

    render("ingredients/show.html.erb")
  end

  def new_form
    render("ingredients/new_form.html.erb")
  end

  def create_row
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("name")
    @ingredient.amount = params.fetch("amount")
    @ingredient.units = params.fetch("units")
    @ingredient.recipe_id = params.fetch("recipe_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/recipes", :notice => "Ingredient created successfully.")
    else
      render("ingredients/new_form.html.erb")
    end
  end

  def edit_form
    @ingredient = Ingredient.find(params.fetch("prefill_with_id"))

    render("ingredients/edit_form.html.erb")
  end

  def update_row
    @ingredient = Ingredient.find(params.fetch("id_to_modify"))

    @ingredient.name = params.fetch("name")
    @ingredient.units = params.fetch("units")
    @ingredient.amount = params.fetch("amount")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredients/edit_form.html.erb")
    end
  end

  def destroy_row
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "Ingredient deleted successfully.")
  end
end
