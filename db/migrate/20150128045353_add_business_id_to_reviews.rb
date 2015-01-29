class AddBusinessIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :business_id, :integer
    add_index :reviews, :business_id
  end
end
