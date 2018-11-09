class AddEnumFieldsToSpecialty < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE education_program AS ENUM ('first', 'second', 'magistracy', 'retraining');
      CREATE TYPE education_form AS ENUM ('ochno', 'zaochno', 'remote');
    SQL

    add_column :specialties, :education_program, :education_program, index: true
    add_column :specialties, :education_form, :education_form, index: true
    add_reference :specialties, :faculty, foreign_key: true
  end

  def down
    remove_column :specialties, :education_program
    remove_column :specialties, :education_form
    remove_reference :specialties, :faculty, index: true, foreign_key: true

    execute <<-SQL
      DROP TYPE education_program;
      DROP TYPE education_form;
    SQL
  end
end
