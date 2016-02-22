require 'rails_helper'
require 'carrierwave/test/matchers'

describe CardImageUploader do
  include CarrierWave::Test::Matchers
  let!(:user) { create :user }
  let!(:deck) { create :deck, user: user }
  let!(:card) { create :card, user: user, deck: deck }

  before :all do
    CardImageUploader.enable_processing = true
  end

  after :all  do
    CardImageUploader.enable_processing = false
  end

  context 'the default version' do
    it 'image size no more than 360x360 px' do
      uploader = CardImageUploader.new(card, :card_image)
      uploader.store!(File.open(Rails.root.join("spec/fixtures/images/test.jpg")))
      uploader.should be_no_larger_than(360, 360)
      uploader.remove!
    end
  end
end
