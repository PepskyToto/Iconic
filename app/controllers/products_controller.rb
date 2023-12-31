class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @products = Product.search_by_title_and_description(params[:query])
    else
      @products = Product.all
      @products = @products.filter_by_sexe(params[:sexe]) if params[:sexe].present?
      @products = @products.filter_by_category(params[:category]) if params[:category].present?
      @products = @products.filter_by_size(params[:size]) if params[:size].present?
      @products = @products.filter_by_couleurs(params[:couleurs]) if params[:couleurs].present?
      @products = @products.filter_by_textile_type(params[:textile_type]) if params[:textile_type].present?
    end
  end

  def my_index
    @products = Product.where(user_id: current_user.id)
  end

  def show
    @product = Product.find_by(id: params[:id])
    @booking = Booking.new

    if @product.nil?
      redirect_to products_path, notice: "Product not found."
    end
  end

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
    @product.update(set_params)

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
    params.require(:product).permit(:title, :category, :size, :price, :description, :availability, :user_id, :couleurs, :sexe, :textile_type,)
  end

end
