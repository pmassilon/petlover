class CreatePet < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.decimal :monthly_cost, precision: 8, scale: 2, default: 0.0
      t.integer :kind
      t.references :person, index: true
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
