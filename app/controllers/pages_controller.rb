class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  layout 'home'
  def home
    redirect_to books_path if current_user
    @books = Book.last(4)
  end
end
