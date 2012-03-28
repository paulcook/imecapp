class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :addressable, :polymorphic=>true
      t.timestamps
    end
  end
end
