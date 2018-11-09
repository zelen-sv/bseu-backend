class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties do |t|
      t.string :term
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Specialty.create_translation_table!(
          title: :string,
          description: :text,
          qualification: { type: :string, array: true, default: [] }
        )
      end

      dir.down do
        Specialty.drop_translation_table!
      end
    end
  end
end
