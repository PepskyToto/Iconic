class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    create
  end

  def create
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

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy

    redirect_to bookmarks_url, notice: "Bookmark deleted."
  end
end
