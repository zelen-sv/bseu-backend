class Faculty < ApplicationRecord
  translates :title
  globalize_accessors locales: [:en, :tm, :ru]
  globalize_validations
  validates :title, presence: true
  validate :validates_globalized_attributes
  has_many :specialties
end
