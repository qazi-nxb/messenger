import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connection")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    debugger
    $('#chatcontainer').append(data.msg_data)
    scroll_bottom()
  }
});
