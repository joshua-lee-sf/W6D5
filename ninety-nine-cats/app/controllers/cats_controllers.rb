class CatsController < ApplicationController 
  def index
    render json: Cat.all
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

  end

  def update

  end

  private
  
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end