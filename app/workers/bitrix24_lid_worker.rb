class Bitrix24LidWorker
  include Sidekiq::Worker

  def perform(bid_id)
    Bitrix24LidService.new(bid_id).create_lid
  end
end
