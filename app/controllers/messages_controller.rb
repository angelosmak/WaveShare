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
    message = Message.find(params[:id])
    like = current_user.likes.create(message: message)
    render json: { message: 'Liked successfully', like_id: like.id }
  end

  def unlike
    message = Message.find(params[:id])
    like = current_user.likes.find_by(message: message)
    like.destroy if like
    render json: { message: 'Unliked successfully' }
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
end
