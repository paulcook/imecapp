class ChangeIs501c3DefaultToFalse < ActiveRecord::Migration
  def up
    change_column :companies, :is_501c3, :boolean, :default=>false
  end

  def down
  end
end
