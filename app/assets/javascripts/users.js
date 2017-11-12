function Survey(attributes){
  this.id = attributes.id
  this.description = attributes.description
  this.title = attributes.title
  this.creator_id = attributes.creator_id
}

$(function () {
  Survey.template = Handlebars.compile($('#user-surveys-template').html())
})

$(function (){
  $('#show-survey').on('click', function(evt){
    // console.log('ciked')
    $.get(this.href)
    .done(json => {
      var created_surveys = []
      var participated_surveys = []

      json.participated_surveys.forEach(att => {
        participated_surveys.push(new Survey(att))
      })
      var participated_surveys_list = Survey.template(participated_surveys)
      $('#user-participated-surveys').html(participated_surveys_list)

      json.created_surveys.forEach(att => {
        created_surveys.push(new Survey(att))
      })
      var created_surveys_list = Survey.template(created_surveys)
      $('#user-created-surveys').html(created_surveys_list)

    })
    .error(err => {
      console.log(err)
    })
    evt.preventDefault()
  })
})
