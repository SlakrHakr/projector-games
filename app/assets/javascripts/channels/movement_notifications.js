App.movement_notifications = App.cable.subscriptions.create("MovementNotificationsChannel", {
  connected: function() {
    console.log('connected')
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data)
  }
});
