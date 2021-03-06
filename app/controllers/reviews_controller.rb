class ReviewsController < ApplicationController
  def index
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    @reviews = Review.all
    @reviews = @reviews.where(price: @price) if @price.present?
    @reviews = @reviews.where(cuisine: @cuisine) if @cuisine.present?
    @reviews = @reviews.near(@location) if @location.present?
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)

    if @review.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(form_params)
      redirect_to review_path(@review)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to root_path
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :address, :body, :score, :ambiance, :cuisine, :price)
  end
end
