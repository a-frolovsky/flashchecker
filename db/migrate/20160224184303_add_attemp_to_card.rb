class AddAttempToCard < ActiveRecord::Migration
  def change
    add_column :cards, :attemp, :integer, null: false, default: 1
  end
end
