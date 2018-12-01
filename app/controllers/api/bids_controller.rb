class Api::BidsController < Api::ApplicationController
  include BidsConcern
  include ExceptionHandler

  def create
    @bid = Bid.create!(bid_params)
    TelegramNotificationWorker.perform_async(@bid.id)
    Bitrix24LidWorker.perform_async(@bid.id)
    json_response(@bid, :created)
  end
end
