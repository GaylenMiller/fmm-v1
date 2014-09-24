class CreateSelectOptions < ActiveRecord::Migration
  def change
    create_table :select_options do |t|
      t.string :domain, null: false
      t.string :code_value, null: false
      t.string :display_value,  null: false
      t.integer :display_order, precision: 5
      t.decimal :value_as_number,  precision: 11, scale: 3

      t.timestamps
    end
  end
end
