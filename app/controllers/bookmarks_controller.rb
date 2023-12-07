class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all

    # Obtenez les IDs des produits mis en favori par l'utilisateur
    product_ids = @bookmarks
    .pluck(:product_id)
  
    # Sélectionnez tous les produits associés aux IDs récupérés
    @products = Product.where(id: product_ids)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user_id = params[:user_id]
    @bookmark.room_id = params[:room_id]

    if @bookmark.save
      redirect_to bookmarks_url, notice: "Bookmark created successfully."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy

    redirect_to bookmarks_url, notice: "Bookmark deleted."
  end
end
