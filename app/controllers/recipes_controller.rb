class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:public]

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def create
    puts 'Creating a new recipe'
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      puts 'Recipe was successfully created'
      flash[:notice] = 'Recipe was successfully created'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe was not created'
      render 'new'
    end
  end

  def new
    @recipe = Recipe.new
    @current_user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @inventories = User.find(current_user.id).inventories
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe was successfully deleted'
    redirect_to recipes_path
  end

  def public
    @recipes = Recipe.where(public: true).order('created_at DESC')
  end

  def update
    @recipe = Recipe.find(params[:id])
    @public = @recipe.public ? false : true
    Recipe.update(@recipe.id, public: @public)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
