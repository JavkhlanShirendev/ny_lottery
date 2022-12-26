class LotteriesController < ApplicationController

  def new
    @lottery = Lottery.new(number_of_participants: 0, number_of_items: 0)
  end
  def create
    permitted = params[:lottery].permit(:number_of_participants, :number_of_items)
    Rails.logger.debug("permitted: #{permitted}")
    @lottery = Lottery.create!(**permitted)

    redirect_to new_lottery_item_path
  end

  def destroy
  end

  def index
    @lotteries = Lottery.all
  end

  def show
  end
end
