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

  def like
    @message = Message.find(params[:id])
    @like = @message.likes.new(like_params)
    @like.user = current_user
    @like.save

  end

  def unlike
    @message = Message.find(params[:id])
    @like = @message.likes.find_by(user_id: current_user)
    @like.destroy
  end

  def create_comment
    @message = Message.find(params[:id])

    @comment = @message.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @message, notice: 'Comment was successfully created.'
    else
      # Handle errors
      redirect_to @message, alert: 'Comment creation failed.'

    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :beach_id)
  end

  def like_params
    params.require(:like).permit(:message_id)
  end


end
