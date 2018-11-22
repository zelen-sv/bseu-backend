class Api::SpecialtiesController < Api::ApplicationController
  include ExceptionHandler
  before_action :set_locale

  def index
    @specialties = Specialty.all
    @specialties = @specialties.by_education_program(params[:education_program]) if params[:education_program].present?
    json_response(@specialties, :ok)
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
end
