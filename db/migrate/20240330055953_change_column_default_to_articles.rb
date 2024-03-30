class ChangeColumnDefaultToArticles < ActiveRecord::Migration[7.0]
  def change
	change_column_default :articles, :slider_order, from: nil, to: 0
	change_column_default :articles, :pickup_order, from: nil, to: 0
  end
end
