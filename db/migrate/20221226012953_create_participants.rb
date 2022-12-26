class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :lottery_id, null: false
      t.integer :status, default: 0
      t.integer :no, null: false
      t.integer :lottery_item_id, null: true

      t.timestamps
    end
  end
end
