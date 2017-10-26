$(function(){
  // event listener for Delete links for questions and answer options
  $('form').on('click','.remove-records', function(evt){
    evt.preventDefault()
    $(this).prev('li').children('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    // debugger
  })
  // event listener for add fields for questions and answer options
  $('form').on('click', '.add_fields', function(evt){
    evt.preventDefault()
    // debugger
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')

    // $('.fields').append($(this).data('fields').replace(regexp, time))
    $(this).parent().prev('.fields').append($(this).data('fields').replace(regexp, time))
  })
})
