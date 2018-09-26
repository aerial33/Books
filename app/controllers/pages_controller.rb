class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # if current_user
    #   redirect_to books_path
    # end
    @books = Book.last(4)
  end
end
