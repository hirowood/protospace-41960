class CommentsController < ApplicationController
  def create

    @comment = Comment.new(comments_parameter)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      render "/prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comments_parameter
    params.require(:comment).permit(:content).merge( prototype_id: params[:prototype_id], user_id: current_user.id )
  end
end
