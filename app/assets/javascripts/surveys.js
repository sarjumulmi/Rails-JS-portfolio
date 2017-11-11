$(document).on('turbolinks:load', function(){
  // event listener for Delete links for questions and answer options
  $('form').on('click','.remove-records', function(evt){

    $(this).prev('li').children('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    evt.preventDefault()
    // return false
    // debugger
  })
  // event listener for add fields for questions and answer options
  $('form').on('click', '.add_fields', function(evt){
    
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')

    $(this).parent().prev('.fields').append($(this).data('fields').replace(regexp, time))
    evt.preventDefault()
  })
})
