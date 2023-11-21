class CreateHairstyles < ActiveRecord::Migration[7.0]
  def change
    create_table :hairstyles do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end