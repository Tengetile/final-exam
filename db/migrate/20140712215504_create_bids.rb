class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.references :auction, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
