class CompaniesController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
 
  
  def index
    if params[:category].blank?
    @companies = Company.all.order("created_at DESC")
      else 
      @category_id = Category.find_by(name: params[:category]).id
      @companies = Company.where(:category_id => @category_id).order("created_at DESC")
      end 
  end
  
  def show
    if @company.reviews.blank?
      @average_review = 0
      else
      @average_review = @company.reviews.average(:rating).round(2)
    end
  end
  
  def new
    @company = current_user.companies.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def create
    @company = current_user.companies.build(company_params)
    @company.category_id = params[:category_id]
    if @company.save
      redirect_to root_path
      else
      render 'new'
    end
  end
  
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def update
    @categories = Category.all.map{ |c| [c.name, c.id] }
    if @company.update(company_params)
      redirect_to company_path(@company)
      else
      render 'edit'
    end
  end
  
  def destroy
    @company.destroy
    redirect_to root_path
  end
  
  private
  
    def company_params
    params.require(:company).permit(:name, :description, :location, :category_id, :company_img)
  end
  
  def find_book
    @company = Company.find(params[:id])
  end
  
  
end
