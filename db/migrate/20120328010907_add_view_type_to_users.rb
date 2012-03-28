class AddViewTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :view_type, :string
    add_column :users, :company_id, :integer
  end
end
