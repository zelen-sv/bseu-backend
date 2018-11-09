function addAnotherField (event, model, field) {
  event.preventDefault();
  var lastField = $(`input[name="${model}[${field}][]"]:last-of-type`).clone();

  lastField.val("")
  $(`.input.${model}_${field}`).append(lastField)
}
