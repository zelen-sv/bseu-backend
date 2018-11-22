module Admin::SpecialtiesHelper
  def education_forms_for_select
    Specialty.education_forms.keys.map {|form| [form, education_form_text(form)] }
  end

  def education_programs_for_select
    Specialty.education_programs.keys.map {|program| [program, education_program_text(program)] }
  end

  def education_program_text(enum_value)
    I18n.t :"enum.education_program.#{enum_value}"
  end

  def education_form_text(enum_value)
    I18n.t :"enum.education_form.#{enum_value}"
  end
end
