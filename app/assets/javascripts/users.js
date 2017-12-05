// camelCase var and functions
function Survey(attributes){
  this.id = attributes.id
  this.description = attributes.description
  this.title = attributes.title
  this.creator_id = attributes.creator_id
  this.created = attributes.created
  this.status = attributes.status
}

Survey.renderTable = function(element, title, surveys) {
  var surveyTemplate = Survey.templateTable({
    title: title,
    surveys: surveys.map(attributes => new Survey(attributes))
  })
  element.empty().html(surveyTemplate)
}

Survey.renderLi = function(element, resp) {
  var surveyTemplateLi = Survey.templateLi(new Survey(resp))
  element.append(surveyTemplateLi)
  $('div.new-form').empty()
  $('a#new-survey').show()
}

$(document).on('turbolinks:load', function (){
  Handlebars.registerHelper("inc", function(value, options){
    return parseInt(value) + 1;
  });

  if ($('#survey-partial-template').html()) {
    Handlebars.registerPartial('survey-partial', $('#survey-partial-template').html())
    Survey.templateTable = Handlebars.compile($('#user-surveys-template').html())
  }

  if ($('#survey-li-template').html()) {
    Survey.templateLi = Handlebars.compile($('#survey-li-template').html())
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
