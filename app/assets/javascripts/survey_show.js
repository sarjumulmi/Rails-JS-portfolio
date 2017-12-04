class AnswerChoice {
  constructor(attributes) {
    this.id = attributes.id
    this.answer_text = attributes.answer_text
  }
}
class Question {
  constructor(attributes) {
    this.id = attributes.id
    this.question_text = attributes.question_text
    this.answer_choices = attributes.answer_choices.map((answer_choice)=> answer_choice)
  }
}
class SurveyShow {
  constructor(attributes) {
    this.id = attributes.id
    this.title = attributes.title
    this.description = attributes.description
    this.creator_id = attributes.creator_id
    this.previousSurvey = attributes.previousSurvey
    this.nextSurvey = attributes.nextSurvey
    this.status = attributes.status
    this.questions = attributes.questions.map((question)=> question)
  }
}

$(document).on('turbolinks:load', function (){
  SurveyShow.template = Handlebars.compile($('#survey-show-template').html())
})

SurveyShow.render = function(element, json, href) {
  var surveyShow = SurveyShow.template(new SurveyShow(json))
  element.empty().html(surveyShow)
  history.pushState(null, null, href)
}


$(document).on('turbolinks:load', function(){
  $('#show-body').on('click','a.pagination', function(evt){
    $.getJSON(this.href)
    .done(json => {
      SurveyShow.render($('#show-body'), json, this.href)
    })
    evt.preventDefault()
  })
})
