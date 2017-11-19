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

$(function (){
  SurveyShow.template = Handlebars.compile($('#survey-show-template').html())
})

$(document).on('turbolinks:load', function(){
  $('a.pagination').on('click', function(evt){
    // console.log(`link clicked: ${this.href}`)
    $.getJSON(this.href)
    .done(json => {
      console.log(`Survey title: ${json.questions[0].answer_choices[0].answer_text}`)
    })
    evt.preventDefault()
  })
})
