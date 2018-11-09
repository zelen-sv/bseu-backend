class Admin::FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_faculty, only: [:edit, :show, :update, :destroy]

  def new
    @faculty = Faculty.new
  end

  def index
    @faculties = Faculty.order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
  end

  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)
    return redirect_to admin_faculties_path if @faculty.save
    flash.now[:error] = 'Не удалось создать факультет!'
    render 'new'
  end

  def update
    return redirect_to admin_faculty_path(@faculty) if @faculty.update(faculty_params)
    flash.now[:error] = 'Не удалось сохранить факультет!'
    render 'edit'
  end

  def destroy
    @faculty.destroy
    redirect_to admin_faculties_path
  end

  private

  def set_faculty
    @faculty = Faculty.find(params[:id])
  end

  def faculty_params
    params.require(:faculty).permit(*Faculty.globalize_attribute_names)
  end
end
