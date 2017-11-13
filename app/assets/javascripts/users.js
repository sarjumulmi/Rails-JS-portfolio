function Survey(attributes){
  this.id = attributes.id
  this.description = attributes.description
  this.title = attributes.title
  this.creator_id = attributes.creator_id
  this.created = attributes.created
}

$(function () {
  Handlebars.registerHelper("inc", function(value, options){
    return parseInt(value) + 1;
  });
  Handlebars.registerPartial('survey-partial', $('#survey-partial-template').html())
  Survey.template = Handlebars.compile($('#user-surveys-template').html())
})

$(function (){
  $('#show-survey').on('click', function(evt){
    // console.log('ciked')
    $.get(this.href)
    .done(json => {
      var created_surveys = []
      var participated_surveys = []

      json.created_surveys.forEach(att => {
        created_surveys.push(new Survey(att))
      })
      var created_surveys_list = Survey.template({title: "Created Surveys", survey: created_surveys})
      $('#user-created-surveys').empty().html(created_surveys_list)

      json.participated_surveys.forEach(att => {
        participated_surveys.push(new Survey(att))
      })
      var participated_surveys_list = Survey.template({title: "Participated Surveys", survey: participated_surveys})
      $('#user-participated-surveys').empty().html(participated_surveys_list)
      $(this).hide()
    })
    .error(err => {
      console.log(err)
    })
    evt.preventDefault()
  })
})
