class ChangeReviewDateTypeToCard < ActiveRecord::Migration
  def change
    change_column :cards, :review_date, :datetime, null: false
  end
end
