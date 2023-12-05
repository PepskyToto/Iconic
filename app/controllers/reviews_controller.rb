class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])

    if @review.nil?
      redirect_to reviews_url, notice: "Review not found."
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.product_id = params[:product_id]
    @review.rating = params[:rating]
    @review.description = params[:description]

    if @review.save
      redirect_to reviews_url, notice: "Review created successfully."
    else
      render 'new'
    end
  end
end
