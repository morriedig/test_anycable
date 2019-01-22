class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = Message.all
  end
end
