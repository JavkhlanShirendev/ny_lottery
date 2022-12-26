class Lottery < ApplicationRecord
  has_many :participants, class_name: 'Participant', inverse_of: :lottery
  has_many :lottery_items, class_name: 'LotteryItem', inverse_of: :lottery

  before_commit :create_participants
  before_commit :disable_other_lotteries
  before_create :make_active

  enum :status, { active: 1, disabled: 0, finished: 2 }

  validates :number_of_participants, length: { maximum: 200 }
  validates :number_of_items, length: { maximum: 200 }
  validates_numericality_of :number_of_participants, greater_than_or_equal: :number_of_items

  def current_lottery_item
    lottery_items.count + 1
  end

  def has_next?
    lottery_items.count < number_of_items
  end

  private

  def create_participants
    (1..number_of_participants).each do |no|
      self.participants.create!(no: no)
    end
  end

  def disable_other_lotteries
    Lottery.where.not(id: self.id).update_all(status: 0)
  end

  def make_active
    self.status = 1
  end
end
