function enableSpecialtyFilter () {
  var params = {
    specialty_title: $("select#specialties").val(),
    faculty_id: $("select#faculties").val(),
    education_program: $("select#education_program").val(),
    education_form: $("select#education_form").val()
  }

  $.ajax({
    url: ' /admin/specialties',
    type: "GET",
    data: params,
    dataType: 'script'
  });
}
