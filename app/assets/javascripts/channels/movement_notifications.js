App.movement_notifications = App.cable.subscriptions.create("MovementNotificationsChannel", {
  connected: function() {
    console.log('connected')
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data);

    var canvas = document.getElementById('game-canvas');
    if (canvas.getContext) {
      var ctx = canvas.getContext('2d');

      ctx.fillStyle = 'rgb(200, 0, 0)';
      ctx.fillRect(data.x - 5, data.y - 5, 10, 10);
    }
  }
});
