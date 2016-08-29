require 'pry'
class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])

  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new

  end

  def create
    # binding.pry
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to @recipe

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





  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, ingredients_attributes:[:name], :ingredient=>[], :ingredient_id=>[], :ingredient_ids=>[])
  end
end
