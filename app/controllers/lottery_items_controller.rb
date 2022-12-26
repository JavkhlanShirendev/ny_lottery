class LotteryItemsController < ApplicationController
  before_action :set_active_lottery
  before_action :set_lottery_item, only: :show

  def new
    redirect_to lotteries_path and return if @lottery.nil?
    redirect_to lottery_items_path and return and return unless @lottery.has_next?
    @lottery_item = @lottery.lottery_items.new
  end

  def create
    redirect_to lottery_items_path and return unless @lottery.has_next?
    won_participant = @lottery.participants.pending.sample
    won_participant.won!
    @lottery_item = @lottery.lottery_items.create!(won_participant: won_participant)

    redirect_to lottery_item_path(@lottery_item)
  end

  def index
    redirect_to new_lottery_path and return unless @lottery
    @lottery_items = @lottery.lottery_items
  end

  def show
  end

  private
  def set_active_lottery
    @lottery = Lottery.where(status: :active).first
  end

  def set_lottery_item
    @lottery_item = LotteryItem.find(params[:id])
  end
end
