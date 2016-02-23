class MainController < ApplicationController
  def index
    if current_user.decks.current.any?
      @deck = current_user.decks.current.take
      @revision_card = @deck.cards.revision.random.take
    else
      @revision_card = current_user.cards.revision.random.take
    end
  end
end
