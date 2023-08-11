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

  def create_reply
    @message = Message.find(params[:message_id])
    @reply = @message.replies.build(reply_params)
    @reply.user_id = current_user.id

    if @reply.save
      # Handle successful reply creation
    else
      # Handle validation errors
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, replies_attributes: [:user_id, :parent_id, :content])
  end
end
