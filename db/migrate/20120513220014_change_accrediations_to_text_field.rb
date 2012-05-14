class ChangeAccrediationsToTextField < ActiveRecord::Migration
  def up
    change_column :companies, :accreditations, :text
  end

  def down
  end
end
