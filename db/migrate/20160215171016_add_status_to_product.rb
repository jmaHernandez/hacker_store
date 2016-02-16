class AddStatusToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :status, :string, :default => "inactive"
  end
end
