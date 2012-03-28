class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_type
      t.string :tax_id
      t.boolean :is_501c3
      t.timestamps
    end
  end
end
