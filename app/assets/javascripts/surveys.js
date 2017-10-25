$(function(){
  $('form').on('click','.remove-records', function(evt){
    evt.preventDefault()
    $(this).prev('li').children('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    // debugger
  })
})
