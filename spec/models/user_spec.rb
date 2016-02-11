require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it 'user create' do
    expect(user).not_to be_nil
  end
end
