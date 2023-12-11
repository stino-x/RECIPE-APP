class InventoriesController < ApplicationController
  before_action :set_inventory

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods.includes(:food)
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy!

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @missing_foods = find_missing_foods(@recipe)

    @total_food_items = @missing_foods.sum(&:quantity)
    @total_price = @missing_foods.sum { |food| food.quantity * food.price }
  end

  def find_missing_foods(recipe)
    recipe_foods = recipe.recipe_foods.includes(:food)
    inventory_foods = @inventory.inventory_foods.includes(:food)

    missing_foods = []

    recipe_foods.each do |recipe_food|
      inventory_food = inventory_foods.find_by(food: recipe_food.food)

      missing_foods << recipe_food.food if inventory_food.nil? || inventory_food.quantity < recipe_food.quantity
    end

    # Ensure the missing_foods have the price attribute
    missing_foods.each { |food| food.price = food.price } # Adjust this line based on your actual implementation

    missing_foods
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :user_id_id)
  end
end
