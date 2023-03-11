class CatsController < ApplicationController 
  def index
    @cats = Cat.all
    render :index
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_url
    else
      render error.full_message, status: :unprocessable_entity
    end
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    
    if @cat.update(cat_params)
      redirect_to cats_url
    else
      render :edit
    end
  end

  private
  
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end