$(window).load ->
  element = document.getElementById("messages")
  element.scrollTop = element.scrollHeight
  update_timestamps()
  setInterval(update_timestamps, 60000)

jQuery ->
  $("#new_message")
    .bind('ajax:success', (event, data, status, xhr) ->
      $('#message_content').val('')
      update_timestamps()
  )
  $('#button-smile').bind('click', () -> return false)
  $('#button-file').bind('click', () -> return false)
  $('#button-image').bind('click', () -> return false)

