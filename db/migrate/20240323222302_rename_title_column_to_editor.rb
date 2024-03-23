class RenameTitleColumnToEditor < ActiveRecord::Migration[7.0]
  def change
	rename_column :editors, :title, :lead
  end
end
