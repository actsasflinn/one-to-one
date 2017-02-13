App.user = App.cable.subscriptions.create "UserChannel",
  connected: ->
    setTimeout =>
      userId = $("[data-channel='messages']").data('user-id')
      console.log(userId)
      @perform 'subscribe', user_id: userId
    , 1000

  received: (data) ->
    $('#messages').append data['message']
    element = document.getElementById("messages")
    element.scrollTop = element.scrollHeight