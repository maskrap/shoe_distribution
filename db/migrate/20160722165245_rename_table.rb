class RenameTable < ActiveRecord::Migration
  def change
    rename_table(:brand_store, :brands_stores)
  end
end
