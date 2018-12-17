class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.datetime :date_from
      t.datetime :date_to
      t.string :comment
      t.timestamps
    end
  end
end
