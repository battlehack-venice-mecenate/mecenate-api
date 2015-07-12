class AddTargetInCentsToPois < ActiveRecord::Migration
  def change
    add_column :pois, :target_in_cents, :integer
  end
end
