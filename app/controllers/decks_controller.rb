class DecksController < ApplicationController
  def index
    @decks = current_user.decks.order(:id)
  end

  def show
    @deck = current_user.decks.find(params[:id])
  end

  def edit
    @deck = current_user.decks.find(params[:id])
  end

  def update
    @deck = current_user.decks.find(params[:id])

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
end
