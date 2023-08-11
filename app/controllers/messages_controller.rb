class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:notice] = "Message was successfully created."
      redirect_to beach_path(@message.beach)
    else
      flash[:alert] = "Error creating message."
      redirect_back(fallback_location: beach_path)
    end
    authorize @message

  end

  private

  def message_params
    params.require(:message).permit(:user_id, :beach_id, :content, :parent_id)
  end
end
