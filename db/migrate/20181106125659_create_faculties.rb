class CreateFaculties < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Faculty.create_translation_table!(title: { type: :string, null: false })
      end

      dir.down do
        Faculty.drop_translation_table!
      end
    end
  end
end
