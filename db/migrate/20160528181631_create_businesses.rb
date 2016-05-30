class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.uuid :uuid
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :website

      t.timestamps null: false
    end
  end
end