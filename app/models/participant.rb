class Participant < ApplicationRecord
  enum :status, { pending: 0, won: 1 }

  has_one :lottery_item, class_name: 'LotteryItem', foreign_key: :won_participant_id, required: false
  belongs_to :lottery, class_name: 'Lottery', foreign_key: :lottery_id

  scope :pending, -> {
    where.not(status: :won)
  }
end
