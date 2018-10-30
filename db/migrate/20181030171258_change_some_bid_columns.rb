class ChangeSomeBidColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :bids, :gender, :integer, default: 1, index: true
    change_column :bids, :passport_id, :string
    change_column :bids, :hostel, :boolean, default: true
  end
end
