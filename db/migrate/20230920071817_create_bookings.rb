class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.datetime :booking_date
      t.references :manicure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
