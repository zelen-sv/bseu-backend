class Bitrix24LidService
  def initialize(bid_id)
    @bid = Bid.find(bid_id)
  end

  def create_lid
    response = HTTParty.post(add_lid_url,
      headers: {"Content-Type" => "application/json"},
      body: lid_params.to_json
      )
  end

  private

  def bitrix_base_url
    Rails.application.credentials[:bitrix][:base_url]
  end

  def bitrix_token
    Rails.application.credentials[:bitrix][:token]
  end

  def bitrix_url
    "#{bitrix_base_url}/#{bitrix_token}"
  end

  def add_lid_url
    "#{bitrix_url}/crm.lead.add.json"
  end

  def lid_title
    "#{@bid.first_name} #{@bid.second_name} inter.bseu.by"
  end

  def lid_params
    {
      fields: {
        TITLE: lid_title,
        NAME: @bid.first_name,
        LAST_NAME: @bid.second_name,
        PHONE: [ { "VALUE": @bid.phone } ],
        EMAIL: [ { "VALUE": @bid.email } ],
        UF_CRM_1543572416: 93
      }
    }
  end
end
