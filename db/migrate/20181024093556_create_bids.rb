class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string :first_name
      t.string :second_name
      t.boolean :gender
      t.string :nationality
      t.integer :passport_id
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
