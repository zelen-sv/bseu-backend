class Api::SpecialtiesController < Api::ApplicationController
  include ExceptionHandler
  before_action :set_locale

  def index
    @specialties = Specialty.where(nil)
    @specialties = @specialties.by_education_program(params[:education_program]) if params[:education_program].present?
    json_response(@specialties, :ok)
  end

  private

  def set_locale
    I18n.locale = params[:locale].to_sym if params[:locale].present?
  end
end
