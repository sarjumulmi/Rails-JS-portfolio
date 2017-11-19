class AnswerChoice {
  constructor(att) {
    this.id = att.id
    this.answer_text = att.answer_text
  }
}
class Question {
  constructor(att) {
    this.id = att.id
    this.question_text = att.question_text
    this.answer_choices = []
    att.answer_choices.forEach( (answer_choice)=> {
      this.answer_choices.push(answer_choice)
    })
  }
}
class SurveyShow {
  constructor(att) {
    this.id = att.id
    this.title = att.title
    this.description = att.description
    this.creator_id = att.creator_id
    this.previousSurvey = att.previousSurvey
    this.nextSurvey = att.nextSurvey
    this.status = att.status
    this.questions = []
    att.questions.forEach( (question)=> {
      this.questions.push(question)
    })
  }
}


$(document).on('turbolinks:load', function(){
  $('#show-body').on('click','a.pagination', function(evt){
    // console.log(`link clicked: ${this.href}`)
    $.getJSON(this.href)
    .done(json => {
      var survey = new SurveyShow(json)
      var survey_show = Handlebars.compile($('#survey-show-template').html())(survey)
      // console.log(survey_show)
      $('#show-body').empty().html(survey_show)
      history.pushState(null, null, this.href)
    })
    evt.preventDefault()
  })
})
