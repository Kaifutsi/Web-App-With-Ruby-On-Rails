class AddBookingFieldsToManicures < ActiveRecord::Migration[7.0]
  def change
    add_column :manicures, :available, :boolean, default: true
    add_column :manicures, :booking_date, :datetime
  end
end
