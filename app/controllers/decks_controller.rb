class DecksController < ApplicationController
  before_action :deck, only: [:show, :edit, :update]

  def index
    @decks = current_user.decks.order(:id)
  end

  def show
  end

  def edit
  end

  def update
    if @deck.update_attributes(deck_params)
      redirect_to decks_path, flash: { success: 'Колода обновлена' }
    else
      flash.now[:warning] = 'Ай-яй'
      render 'edit'
    end
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      redirect_to decks_path, flash: { success: 'Колода создана' }
    else
      flash.now[:warning] = 'Ай-яй'
       render 'new'
    end
  end

  def destroy
    current_user.decks.find(params[:id]).destroy
    redirect_to decks_path, flash: { success: 'Колода удалена' }
  end

  private
  def deck_params
    params.require(:deck).permit!
  end

  def deck
    @deck = current_user.decks.find(params[:id])
  end
end
