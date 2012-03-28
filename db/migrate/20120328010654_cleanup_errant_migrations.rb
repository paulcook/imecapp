class CleanupErrantMigrations < ActiveRecord::Migration
  def up
    drop_table :providers
    drop_table :supporters
  end

  def down
  end
end
