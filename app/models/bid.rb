class Bid < ApplicationRecord
  enum gender: { male: 1, female: 2 }
  validates :first_name, :second_name, :gender, :nationality, :passport_id, :email, :phone,
      :birthday, :passport_starts_at, :passport_ends_at, :passport_authority, :education_type,
      :education_form, presence: true
end
