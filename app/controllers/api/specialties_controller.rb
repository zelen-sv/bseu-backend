class Api::SpecialtiesController < Api::ApplicationController
  include ExceptionHandler
  before_action :set_locale

  def index
    @specialties = Specialty.by_education_program(params[:education_program])
    json_response(@specialties, :ok)
  end

  private

  def set_locale
    I18n.locale = params[:locale].to_sym if params[:locale]
  end
end
