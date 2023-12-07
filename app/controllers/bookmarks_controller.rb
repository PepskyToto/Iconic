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
    create
  end

  def create
    @product = Product.find(params[:product_id])
    existing_bookmark = Bookmark.find_by(product_id: @product.id, user_id: current_user)
    if existing_bookmark
    # Le bookmark existe, donc supprime-le
    existing_bookmark.destroy
    redirect_to root_path, notice: "Le produit a bien été retiré de vos favoris."
    else 
      @bookmark = Bookmark.new
      @product = Product.find(params[:product_id])
      @bookmark.product_id = @product.id
      @bookmark.user_id = current_user.id
      @bookmark.save
      if @bookmark.save
        redirect_to root_path, notice: "Le produit a bien été ajouté à vos favoris."      
      else
        redirect_to root_path, notice: "Veuillez vous connecter pour ajouter un produit à vos favoris."      
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy

    redirect_to bookmarks_url, notice: "Bookmark deleted."
  end
end
