class CreateEditors < ActiveRecord::Migration[7.0]
  def change
    create_table :editors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_ruby, null: false
      t.string :last_name_ruby, null: false
      t.date :birthday
      t.text :thumb_path, null: false
      t.string :organization, null: false
      t.string :position, null: false
      t.string :lead, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
