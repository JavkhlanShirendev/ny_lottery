class CreateLotteries < ActiveRecord::Migration[7.0]
  def change
    create_table :lotteries do |t|
      t.integer :number_of_participants
      t.integer :status, default: 0
      t.integer :number_of_items, default: 0

      t.timestamps
    end
  end
end
