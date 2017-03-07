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
      return false
  )
  $('#button-file').bind('click', () ->
    $('#message_file-dropzone').show()
    return false
  )

  messageDropzone = new Dropzone("#message_file-dropzone")
  Dropzone.options.messageDropzone = false
  messageDropzone.options.paramName = "message[file]"
  messageDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif,.pdf"

  messageDropzone.on("complete", (file) ->
    messageDropzone.removeFile(file)
    rejectedFiles = messageDropzone.getRejectedFiles()
    if(rejectedFiles.length != 0)
      alert('Error uploading ' + rejectedFiles.length + ' files. Not all file types are accepted.')
    else
      $('#message_file-dropzone').hide()
  )