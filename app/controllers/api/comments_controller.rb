class Api::CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_comment, only: [:show, :update,:destroy]
  
  def index
    render json: @comment = Comment.all
  end

  def show
    render json: @comment
  end

  def create
    if @comment.save
      render json: @comment
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: 'Comment deleted'}
  end

  def update

    if @comment.update(comment_params)
      render json: @comment
    else 
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end

  end

private

  def set_topic

    @topic=Topic.find(params[:id])

  end

  def set_comment

    @comment = @topic.comments.find(params[:id])

  end

  def comment_params
    params.require(:comment).permit(:title,:body)
  end
end