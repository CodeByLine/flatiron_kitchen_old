class AddColumnToRecipeTable < ActiveRecord::Migration
  def change
    AddColumn :recipe, :ingredient_id, :integer
  end
end
