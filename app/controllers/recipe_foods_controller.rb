# app/controllers/recipe_foods_controller.rb
class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_recipe_food, only: %i[edit update destroy]

  def new
    @recipe_food = @recipe.recipe_foods.build
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    if @recipe_food.save
      redirect_to @recipe, notice: 'Ingredient added to recipe.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: 'Ingredient updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Ingredient removed from recipe.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
