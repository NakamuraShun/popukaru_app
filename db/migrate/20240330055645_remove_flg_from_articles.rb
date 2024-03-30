class RemoveFlgFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :slider_flg, :boolean
    remove_column :articles, :pickup_flg, :boolean
  end
end
