class MainController < ApplicationController
  def index
    # @revision_card = Card.revision.random.take
    @revision_card = Card.order("RANDOM()").first
  end
end
