class SpecialtySerializer < ActiveModel::Serializer
  attributes :title, :description, :qualification, :education_program, :education_form,
             :term, :price, :faculty

  def faculty
    object.faculty.title
  end
end
