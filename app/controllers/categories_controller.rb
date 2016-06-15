class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_filter :set_request_from, only: [:update]
    
    def index
        @categories = Category.all
    end
    
    def show
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        respond_to do |format|
          if @category.save
            format.html { redirect_to @category, notice: 'category was successfully created.' }
            format.json { render :index, status: :created, location: @category }
          else
            format.html { render :new }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to @category, notice: 'Category was successfully updated.' }
                format.json { render :index, status: :ok, location: @index }
            else
                format.html { render :edit }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end
  
    def destroy
        @category.destroy
        # flash[:success] = "Category deleted"
        # redirect_to 'categories/index'
        respond_to do |format|
          format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
  
    private
    def set_category
        @category = Category.find(params[:id])
    end
    
    def category_params
        params.require(:category).permit(:name)
    end
end
