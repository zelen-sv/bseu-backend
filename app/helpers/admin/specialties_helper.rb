module Admin::SpecialtiesHelper
  PROGRAM_TITLES = ["Первое высшее", "Второе высшее", "Магистратура", "Переподготовка"].freeze
  FORM_TITLES = ["Очно", "Заочно", "Дистанционно"].freeze

  def select_data_education_programs
    Hash[Specialty.education_programs.keys.map.with_index {|prog, index| [prog, PROGRAM_TITLES[index]] }]
  end

  def select_data_education_forms
    Hash[Specialty.education_forms.keys.map.with_index {|prog, index| [prog, FORM_TITLES[index]] }]
  end

  def education_programs_text(program)
    select_data_education_programs[program]
  end

  def education_forms_text(form)
    select_data_education_forms[form]
  end
end
