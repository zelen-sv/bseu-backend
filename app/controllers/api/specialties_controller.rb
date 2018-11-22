class Api::SpecialtiesController < Api::ApplicationController
  include ExceptionHandler
  include LocaleHandler

  def index
    @specialties = Specialty.all
    @specialties = @specialties.by_education_program(params[:education_program]) if params[:education_program].present?
    @specialties = translate_in_locale(params[:locale], @specialties) if params[:locale].present?
    json_response(@specialties, :ok)
  end
end
