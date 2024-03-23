class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_ruby, null: false
      t.string :last_name_ruby, null: false
      t.string :organization, null: false
      t.string :position, null: false
      t.string :email, null: false
      t.integer :tel, null: false, limit: 1
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
