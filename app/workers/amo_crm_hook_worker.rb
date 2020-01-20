class AmoCrmHookWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(bid_id)
    AmoCrm::LeadHook.new(bid_id).push
  end
end
