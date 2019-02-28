class TransactionsController < ApplicationController
  def create
    book = Book.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        amount: book.price,
        currency: "eur",
        card: token,
        description: current_user.email)
      @sale = book.sales.create!(
        buyer_email: current_user.email)
      redirect_to pickup_path(guid: @sale.guid)
    rescue Stripe::CardError => e
      @error = e
      redirect_to book_path(book), notice: @error
    end
    authorize book
  end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @book = @sale.book
    authorize @sale
  end
end
