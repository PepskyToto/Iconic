class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])

    if @product.nil?
      redirect_to products_path, notice: "Product not found."
    end
  end

#  def search
#    @products = Product.where("title LIKE ?", "%#{params[:search]}%")
#  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(set_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path, notice: "Product created successfully."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])

    if @product.nil?
      redirect_to products_url, notice: "Product not found."
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.image = params[:image]

    if @product.save
      redirect_to products_url, notice: "Product updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to products_url, notice: "Product deleted."
  end

  private

  def set_params
    params.require(:product).permit(:title, :category, :size, :price, :description, :availability, :user_id)
  end

end
