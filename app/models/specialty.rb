class Specialty < ApplicationRecord
  translates :title, :description, :qualification
  globalize_accessors locales: [:en, :tm, :ru]
  globalize_validations
  validates :title, :description, :qualification, :education_program, :education_form, :price, :term, presence: true
  validate :validates_globalized_attributes
  enum education_program: {
    first_higher:  'first',
    second_higher: 'second',
    magistracy:    'magistracy',
    retraining:    'retraining'
  }
  enum education_form: {
    ochno:   'ochno',
    zaochno: 'zaochno',
    remote:  'remote'
  }
  belongs_to :faculty

  before_update :remove_blank_qualifications
  before_save :remove_blank_qualifications

  scope :by_faculty, -> (faculty_id) { where faculty_id: faculty_id }
  scope :by_education_program, -> (education_program) { where education_program: education_program }
  scope :by_education_form, -> (education_form) { where education_form: education_form }

  private

  def remove_blank_qualifications
    qualification_translations.map { |_, qualification| qualification.reject!(&:blank?) }
  end
end
