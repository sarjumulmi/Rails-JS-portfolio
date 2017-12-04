// camelCase var and functions
function Survey(attributes){
  this.id = attributes.id
  this.description = attributes.description
  this.title = attributes.title
  this.creator_id = attributes.creator_id
  this.created = attributes.created
}

Survey.render = function(element, title, surveys) {
  var surveyTemplate = Survey.template({
    title: title,
    surveys: surveys.map(attributes => new Survey(attributes))
  })
  element.empty().html(surveyTemplate)
}

$(document).on('turbolinks:load', function (){
  Handlebars.registerHelper("inc", function(value, options){
    return parseInt(value) + 1;
  });

  if ($('#survey-partial-template').html()) {
    Handlebars.registerPartial('survey-partial', $('#survey-partial-template').html())
    Survey.template = Handlebars.compile($('#user-surveys-template').html())
  }

  $('#show-surveys').on('click', function(evt){
    $.get(this.href)
      .done(json => {
        Survey.render($('#user-created-surveys'), 'Created Surveys', json.created_surveys)
        Survey.render($('#user-participated-surveys'), 'Participated Surveys', json.participated_surveys)
      })
      .error(err => {
        console.log(err)
      })
    evt.preventDefault()
  })
})
