class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :museum
      t.integer :user_id
      t.string :date
      t.integer :num_of_people

      t.timestamps
    end
  end
end
