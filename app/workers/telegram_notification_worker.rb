class TelegramNotificationWorker
  include Sidekiq::Worker

  def perform(bid_id)
    TelegramNotificatorService.new(bid_id).run
  end
end
