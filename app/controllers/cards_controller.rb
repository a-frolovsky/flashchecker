class CardsController < ApplicationController
  before_action :decks, only: [:edit, :update, :new, :create]

  def index
    @cards = current_user.cards.order(:review_date)
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(card_params)
      redirect_to cards_path
    else
      render 'edit'
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

  def revision_card
    @card = Card.find(params[:card][:id])

    if @card.check_answer(params[:answer])
      redirect_to root_path, flash: { success: "Правильно" }
    else
      redirect_to root_path, flash: { warning: "Не правильно" }
    end
  end

  private
  def card_params
    params.require(:card).permit!
  end

  def decks
    @decks = current_user.decks
  end
end
