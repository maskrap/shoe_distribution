class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end
  end
end
