class DeleteTables < ActiveRecord::Migration
  def change
    drop_table :user_specs
    drop_table :product_specs
  end
end
