module BidsConcern
  def bid_params
    params.require(:bid).permit(:first_name, :second_name, :gender, :nationality, :passport_id, :email, :phone,
      :birthday, :passport_starts_at, :passport_ends_at, :passport_authority, :education_type, :education_form,
      :hostel, :arrival_date)
  end
end
