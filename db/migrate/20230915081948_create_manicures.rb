class CreateManicures < ActiveRecord::Migration[7.0]
  def change
    create_table :manicures do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
