class TelegramNotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(bid_id)
    TelegramNotificatorService.new(bid_id).run
  end
end
