class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|

      t.timestamps
    end
  end
end
