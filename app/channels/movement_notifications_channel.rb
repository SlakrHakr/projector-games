class MovementNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "movement_notifications_channel"
  end

  def unsubscribed
  end
end
