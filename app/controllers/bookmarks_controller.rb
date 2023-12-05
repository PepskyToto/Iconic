class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
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
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy

    redirect_to bookmarks_url, notice: "Bookmark deleted."
  end
end
