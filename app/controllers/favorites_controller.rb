class FavoritesController < ApplicationController
  before_action :set_book

  def create
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    if favorite
      favorite.destroy
    end
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

end
