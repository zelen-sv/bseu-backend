class TelegramNotificatorService
  def initialize(bid_id)
    @bot = Telegram::Bot::Client.new(token)
    @bid = Bid.find(bid_id)
  end

  def run
    @bot.send_message(chat_id: chat_id, text: full_message)
  end

  def token
    Rails.application.credentials.development[:telegram][:token]
  end

  def chat_id
    Rails.application.credentials.development[:telegram][:chat_id]
  end

  def message_data
    {
      'Имя' => @bid.first_name,
      'Телефон' => @bid.phone,
      'E-mail' => @bid.email
    }
  end

  def full_message
    rows = ["Новая заявка 'inter.bseu.by'\n\n"]
    message_data.each do |key, value|
      rows.push "#{key}:  #{value}\n"
    end
    rows.join
  end
end
