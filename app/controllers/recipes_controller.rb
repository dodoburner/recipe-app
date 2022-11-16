class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :destroy, :create]
  before_action :authenticate_user!

  

  def index
      @recipes = Recipe.all
  end

  def create
      puts "Creating a new recipe"
      @recipe = Recipe.new(recipe_params)
      @recipe.user = current_user
      puts @recipe
      if @recipe.save
          puts "Recipe was successfully created"
          flash[:notice] = "Recipe was successfully created"
          redirect_to user_recipes_path
      else
          flash[:alert] = "Recipe was not created"
          render 'new'
      end
  end

  def new
      @recipe = Recipe.new
      @current_user = current_user
  end

  def show
      @recipe = Recipe.find(params[:id])
  end

  def destroy
      @recipe.destroy
      flash[:notice] = "Recipe was successfully deleted"
      redirect_to recipes_path
  end

  private

  def set_recipe
      @recipe = Recipe.find(params[:id])
  end

  def recipe_params
      params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end