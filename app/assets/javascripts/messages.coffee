$(window).load ->
  element = document.getElementById("messages")
  element.scrollTop = element.scrollHeight

jQuery ->
  $("#new_message")
    .bind('ajax:success', (event, data, status, xhr) ->
      $('#message_content').val(''))
  $('#button-smile').bind('click', () -> return false)
  $('#button-file').bind('click', () -> return false)
  $('#button-image').bind('click', () -> return false)
