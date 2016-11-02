class MessagesController < ApplicationController
  def index
  	@room = Room.find(params[:room_id])
  	@messages= Message.all
  end

def create
	  	@room = Room.find(params[:room_id])
	@message= Message.new(params_message)
	if @message.save
		redirect_to room_messages_path(@room)
	else
		redirect_to room_messages_path(@room)
	end
end

private

def params_message
	params.require(:message).permit(:username,:content,:room_id)
end
end
