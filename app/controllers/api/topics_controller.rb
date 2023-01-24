class Api::TopicsController < ApplicationController
before_action :set_sub
before_action :set_topic,only: [:show, :update,:destroy]

def index
    @topics=Topic.all
    render json: @topics
end
def show
    # @topic = Topic.find(params[:id]) before
    # render json:@topic
    # @topics = @sub.topics #after 
    render json: @topics    
end

def create
    # @topic=@sub.topics.new(topic_params)
    if topic.save
        render json: @topic
        else
            render json:{errors: @topic.errors},status: :unprocessable_entity
    end
else
    
end  
def update
    # @topic=Topic.find(params[:id])
    if @topic.update(topic_params)
        render json: @topic
    else
        render json: {errors: @topic.errors},status: :unprocessable_entity
    end
end
def destroy
    @topic.destroy
    render json: {messagee:'topic deleted'}
end
private
    def set_sub
        @sub=Sub.find(params[:sub_id])
    end

    def set_topic
        @topic=@sub.topics.find(params[:id])
    end

    def topic_params
        params.require(:topics).permit(:title,:body)
    end

end
