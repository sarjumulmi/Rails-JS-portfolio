Survey.renderTable = function(element, title, surveys) {
  var surveyTemplate = Survey.templateTable({
    title: title,
    surveys: surveys.map(attributes => new Survey(attributes))
  })
  element.empty().html(surveyTemplate)
}

$(document).on('turbolinks:load', function (){
  Handlebars.registerHelper("inc", function(value, options){
    return parseInt(value) + 1;
  });
  // handlebars template and partial for user show page
  if ($('#survey-partial-template').html()) {
    Handlebars.registerPartial('survey-partial', $('#survey-partial-template').html())
    Survey.templateTable = Handlebars.compile($('#user-surveys-template').html())
  }

  $('#show-surveys').on('click', function(evt){
    $.get(this.href)
      .done(json => {
        Survey.renderTable($('#user-created-surveys'), 'Created Surveys', json.created_surveys)
        Survey.renderTable($('#user-participated-surveys'), 'Participated Surveys', json.participated_surveys)
      })
      .error(err => {
        console.log(err)
      })
    evt.preventDefault()
  })
})
