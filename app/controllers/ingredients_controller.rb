class IngredientsController < ApplicationController
  def index
    @ingredients = ingredient.all

    render("ingredients/index.html.erb")
  end

  def show
    @ingredient = ingredient.find(params.fetch("id_to_display"))

    render("ingredient/show.html.erb")
  end

  def new_form
    render("ingredients/new_form.html.erb")
  end

  def create_row
    @ingredient = ingredient.new

    @ingredient.name = params.fetch("name")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients", :notice => "ingredient created successfully.")
    else
      render("ingredients/new_form.html.erb")
    end
  end

  def edit_form
    @ingredient = ingredient.find(params.fetch("prefill_with_id"))

    render("ingredients/edit_form.html.erb")
  end

  def update_row
    @ingredient = ingredient.find(params.fetch("id_to_modify"))

    @ingredient.name = params.fetch("name")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "ingredient updated successfully.")
    else
      render("ingredients/edit_form.html.erb")
    end
  end

  def destroy_row
    @ingredient = ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "ingredient deleted successfully.")
  end
end
