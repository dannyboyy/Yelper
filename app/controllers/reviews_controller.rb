class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_business
  before_action :authenticate_user!

  respond_to :html

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.business_id = @business.id
    
    if @review.save
      redirect_to @business
    else
      render 'new'
    end
  end

  def update
    @business = Business.find(params[:business_id])
    if @review.update(review_params)
      redirect_to @business
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_business
      @business = Business.find(params[:business_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :price)
    end
end
