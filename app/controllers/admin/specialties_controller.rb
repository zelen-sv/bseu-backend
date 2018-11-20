class Admin::SpecialtiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_specialty, only: [:edit, :show, :update, :destroy, :duplicate]

  def new
    @specialty = Specialty.new
  end

  def index
    @specialties = Specialty.where(nil)
    @specialties = @specialties.by_faculty(params[:faculty_id]) if params[:faculty_id].present?
    @specialties = @specialties.by_education_program(params[:education_program]) if params[:education_program].present?
    @specialties = @specialties.by_education_form(params[:education_form]) if params[:education_form].present?
    @specialties = @specialties.by_title(params[:specialty_title]) if params[:specialty_title].present?
    @specialties = @specialties.order(created_at: :desc).page(params[:page]).per(15)
    @specialties_titles = Specialty.titles
    @faculties = Faculty.all
  end

  def show
  end

  def edit
  end

  def create
    @specialty = Specialty.new(specialty_params)
    return redirect_to admin_specialties_path if @specialty.save
    flash.now[:error] = 'Не удалось создать специальность!'
    render 'new'
  end

  def update
    return redirect_to admin_specialty_path(@specialty) if @specialty.update(specialty_params)
    flash.now[:error] = 'Не удалось сохранить специальность!'
    render 'edit'
  end

  def destroy
    @specialty.destroy
    redirect_to admin_specialties_path
  end

  def duplicate
    @duplicate_specialty = @specialty.dup
    flash.now[:error] = 'Не удалось скопировать специальность!' unless @duplicate_specialty.save
    redirect_to admin_specialties_path
  end

  private

  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(
      *Specialty.globalize_attribute_names,:price, :term, :faculty_id,
      :education_program, :education_form, qualification_ru: [], qualification_tm: [], qualification_en: []
    )
  end
end
