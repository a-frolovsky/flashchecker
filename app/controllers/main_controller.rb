class MainController < ApplicationController
  def index
    @revision_card = Card.revision.when_user(current_user).random.take
  end
end
