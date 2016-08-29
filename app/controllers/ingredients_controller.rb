class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
     @ingredient.recipes.build(name: 'name')
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to @ingredient

  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient.id)
    end


  def show
    @ingredient = Ingredient.find(params[:id])
  end


  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_url
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, recipes_attributes:[:name], :recipe_ids=>[])
  end

end
