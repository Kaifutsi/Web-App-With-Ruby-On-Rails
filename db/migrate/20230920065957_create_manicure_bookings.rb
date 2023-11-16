class CreateManicureBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :manicure_bookings do |t|
      t.integer :manicure_id
      t.string :user_name
      t.date :booking_date

      t.timestamps
    end
  end
end
