class BrandsStores < ActiveRecord::Migration
  def change
    create_table(:brand_store) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
