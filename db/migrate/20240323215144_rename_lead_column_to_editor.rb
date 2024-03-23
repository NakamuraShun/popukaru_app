class RenameLeadColumnToEditor < ActiveRecord::Migration[7.0]
  def change
	rename_column :editors, :lead, :title
  end
end
