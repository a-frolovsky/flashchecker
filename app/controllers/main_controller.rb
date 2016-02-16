class MainController < ApplicationController
  def index
    @revision_card = current_user.cards.revision.random.take
  end
end
