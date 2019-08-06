class CatsController < ApplicationController
  
  def index
    @cats = Cat.all 
    render :index
  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
   new_cat = Cat.new(params.require(:cat).permit(:name, :description, :sex, :color, :birth_date))

    if new_cat.save
      redirect_to cat_url(new_cat)
    else
      render json: new_cat.save.errors.full_messages, status: 422
    end
  end

  def update
    @cat = Cat.new(params.require(:cat).permit(:name, :description, :sex, :color, :birth_date))
    if @cat.persisted?
      @cat = Cat.find(params[:id])
      @cat.update(params.require(:cat).permit(:name, :description, :sex, :color, :birth_date))
      redirect_to cat_url(@cat)
    
    else
      render json: "Something went wrong... :("
      # redirect_to cats_url
    end
  end


  def edit
    @cat = Cat.find(params[:id])
    if @cat
      render :edit
    else
      render json: "Cat does not exist"
    end
  end

end
