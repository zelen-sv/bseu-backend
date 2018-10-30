module BidsHelper
  def full_name(bid)
    "#{bid.first_name} #{bid.second_name}"
  end

  def gender_radios_params
    {
      as: :radio_buttons,
      label: false,
      input_html: { class: 'form-check-input' },
      collection: [['1', 'мужской'], ['2', 'женский']],
      label_method: :second,
      value_method: :first
    }
  end
end
