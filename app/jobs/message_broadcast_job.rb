class MessageBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message, channel_id)
    puts message, channel_id
    puts "================="
    ActionCable.server.broadcast "room_channel_#{ channel_id }", message: render_message(message)
  end

  private

  def render_message message
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
