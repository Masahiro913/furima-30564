class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_number, null: false
      t.integer    :prefecture_id, null: false
      t.string     :city_town, null: false
      t.string     :addressline, null:false
      t.string     :building_name
      t.string    :tell_buyer, null: false
      t.references :deal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
