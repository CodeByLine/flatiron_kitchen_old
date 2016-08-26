class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients


  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end
end
