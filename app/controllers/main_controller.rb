class MainController < ApplicationController
  def index
    @revision_card = Card.revision.user(current_user).random.take
  end
end
