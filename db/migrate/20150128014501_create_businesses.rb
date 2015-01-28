class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :address
      t.string :rating

      t.timestamps
    end
  end
end
