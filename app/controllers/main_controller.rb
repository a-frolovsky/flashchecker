class MainController < ApplicationController
  def index
    @revision_card = Card.revision.random.take
  end
end
