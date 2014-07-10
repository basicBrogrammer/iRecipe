class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  # before_action :authorize, except: [:index, :show]


  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.includes(:tags)
  end
  def tags
    @tag = params[:tag]
    @books = Recipe.tagged_with(@tag).includes(:tags)
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)


    if @recipe.save
      redirect_to dashboard_index_path, notice: "Your recipe was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update

      if @recipe.update(recipe_params)
        redirect_to dashboard_index_path, notice: "Your recipe was updated successfully. "
      else
        render :edit
      end
  end


  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:description, :meal, :title,:tag_list,
                                     ingredients_attributes: [:id, :item, :amount, :_destroy],
                                     steps_attributes: [:id, :procedure, :_destroy])
    end
end

