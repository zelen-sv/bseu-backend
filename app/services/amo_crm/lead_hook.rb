class AmoCrm::LeadHook
  include Rails.application.routes.url_helpers

  def initialize(bid_id)
    @bid = Bid.find(bid_id)
    @lead = {}
    @contact = {}
  end

  def push
    create_lid
    create_contact
  end

  private

  def create_lid
    @lead = AmoCrm::Lead.new(
      name:  lead_name,
      status_id: lead_status,
      responsible_user_id: lead_responsible_user,
      platform_link: platform_link,
      pipeline_id: pipeline_id
    )

    @lead.save!
  end

  def create_contact
    @contact = Amorail::Contact.new(
      name: full_name,
      phone: @bid.phone,
      email: @bid.email
    )

    @contact.linked_leads_id << @lead.id
    @contact.save!
  end

  def lead_name
    "#{full_name} (поступление БГЭУ)"
  end

  def full_name
    "#{@bid.first_name} #{@bid.second_name}"
  end

  def lead_status
    '30411862'
  end

  def lead_responsible_user
    '3902737'
  end

  def platform_link
    admin_bid_url(@bid.id)
  end

  def pipeline_id
    '2275357'
  end
end
