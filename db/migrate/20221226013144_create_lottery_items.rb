class CreateLotteryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :lottery_items do |t|
      t.integer :lottery_id, null: false
      t.integer :won_participant_id, null: false

      t.timestamps
    end
  end
end
