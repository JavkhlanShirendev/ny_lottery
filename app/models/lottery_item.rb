class LotteryItem < ApplicationRecord
  belongs_to :lottery, class_name: 'Lottery'
  belongs_to :won_participant, class_name: 'Participant', foreign_key: :won_participant_id
end
