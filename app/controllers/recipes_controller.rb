class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @ingredient = Ingredient.new
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end


  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    # redirect_to recipe_url
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredient, :ingredient_ids => [])
  end
end
