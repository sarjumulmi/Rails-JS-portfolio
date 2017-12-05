function Survey(attributes){
  this.id = attributes.id
  this.description = attributes.description
  this.title = attributes.title
  this.creator_id = attributes.creator_id
  this.created = attributes.created
  this.status = attributes.status
}

Survey.renderLi = function(element, resp) {
  var surveyTemplateLi = Survey.templateLi(new Survey(resp))
  element.append(surveyTemplateLi)
  $('div.new-form').empty()
  $('a#new-survey').show()
}
// handlebars template for survey index page
$(document).on('turbolinks:load', function(){
  if ($('#survey-li-template').html()) {
    Survey.templateLi = Handlebars.compile($('#survey-li-template').html())
  }
  Handlebars.registerHelper('and', function(v1, v2){
    return v1 && v2
  })
  Handlebars.registerHelper('eq', function(v1, v2){
    return v1 == v2
  })
})

$(document).on('turbolinks:load', function(){
  // event listener for Delete links for questions and answer options
  $('div.new-form').on('click','.remove-records', function(evt){
    $(this).prev('li').children('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    evt.preventDefault()
  })
  // event listener for add fields for questions and answer options
  $('div.new-form').on('click', '.add_fields', function(evt){
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().prev('.fields').append($(this).data('fields').replace(regexp, time))
    evt.preventDefault()
  })

  // event listener for new survey form submission from survey#index page
  $('div.new-form').on('submit', 'form.new-survey', function(evt){
    evt.preventDefault()
    $.ajax({
      type: 'post',
      url: this.action,
      data: $(this).serialize()
    }).done((resp)=>{
      Survey.renderLi($('ul#surveys'), resp)
    })
  })
})
