class CategoriesController < ApplicationController

  def index

    if params[:category_root].present?
      root_category = Category.find(params[:category_root])
      @categories = root_category.children
    elsif params[:category_child].present?
      child_category = Category.find(params[:category_child])
      @categories = child_category.children
    end

  end  
    
end
