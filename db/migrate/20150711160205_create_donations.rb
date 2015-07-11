class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :poi
      t.integer :amount_in_cents
      t.boolean :anonymous
      t.text :braintree_response
      t.boolean :success

      t.timestamps
    end
  end
end
