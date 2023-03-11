class CatsController < ApplicationController 
  def index
    @cats = Cat.all
    render :index
  end

  def create
    @cat = Cats.new(cat_params)

    if @cat.save
      redirect_to cats_url
    else
      render error.full_message, status: :unprocessable_entity
    end
  end

  def new

  end

  def edit

  end

  def show
    @cat = Cat.find_by(params[:id])
    render json: @cat
  end

  def update

  end

  private
  
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end