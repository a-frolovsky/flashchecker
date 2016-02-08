class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(card_params)
      redirect_to cards_path
    else
      redirect_to edit_card_path(@card)
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)

    if @card.valid?
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def destroy
    Card.find(params[:id]).destroy
    redirect_to cards_path
  end

  private
  def card_params
    params.require(:card).permit!
  end
end
