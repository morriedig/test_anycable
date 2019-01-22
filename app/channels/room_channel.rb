class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{ params[:room] }"
    puts params[:room]
    puts "-----------------"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    Message.create!(content: data['message'])
  end

  def send_message data
    message = Message.create!(content: data['message'])
    MessageBroadcastJob.perform_later( message, data["room_id"] )
    puts "hahahaha"
  end
end
