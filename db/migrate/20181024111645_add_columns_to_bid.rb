class AddColumnsToBid < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :birthday, :string
    add_column :bids, :passport_starts_at, :string
    add_column :bids, :passport_ends_at, :string
    add_column :bids, :passport_authority, :string
    add_column :bids, :education_type, :string
    add_column :bids, :education_form, :string
    add_column :bids, :hostel, :boolean
    add_column :bids, :arrival_date, :string

    change_column :bids, :gender, :integer, :using => 'case when gender then 1 else 2 end'
  end
end
