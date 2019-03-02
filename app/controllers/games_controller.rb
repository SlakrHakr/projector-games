class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:movement]

  def index; end

  def show; end

  def movement
    ActionCable.server.broadcast 'movement_notifications_channel', x: params[:x], y: params[:y]
  end
end
