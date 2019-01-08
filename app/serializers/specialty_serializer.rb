class SpecialtySerializer < ActiveModel::Serializer
  attributes :title, :description, :qualification, :education_program, :education_form,
             :term, :price, :faculty, :id

  def faculty
    object.faculty.title
  end

  def price
    object.price.try(:to_i)
  end
end
