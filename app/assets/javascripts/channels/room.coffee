$(document).ready ->

  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $("#channel").attr("data-room") },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)
      $('#messages').append data['message']

    speak: (message, room_id) ->
      console.log("----")
      @perform 'send_message',{ message:message , room_id: room_id}

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 #return
      App.room.speak event.target.value, $(this).attr("data-room")
      event.target.value = ''
      event.preventDefault()