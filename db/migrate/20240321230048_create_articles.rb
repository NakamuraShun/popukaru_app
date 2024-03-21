class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :lead, null: false
      t.text :content, null: false
      t.text :mv_path, null: false
      t.string :meta_title, null: false
      t.string :meta_keyword, null: false
      t.string :meta_description, null: false
      t.references :category, null: false, foreign_key: true
      t.references :editor, null: false, foreign_key: true
      t.integer :status, null: false, limit: 1
      t.datetime :public_datetime
      t.datetime :private_datetime
      t.boolean :slider_flg, null: false
      t.integer :slider_order, null: false, limit: 1
      t.boolean :pickup_flg, null: false
      t.integer :pickup_order, null: false, limit: 1

      t.timestamps
    end
  end
end
