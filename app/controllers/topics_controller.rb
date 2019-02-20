class TopicsController < ApplicationController
        before_action :set_sub 
        before_action :set_topic, only: [:show, :edit, :update, :destroy]
      
        def index
          @topics = @sub.topics
        end
      
        def show
        end
      
        def new
          @topic = @sub.topics.new
          render partial: "form"
        end
      
        def create
          @topic = @sub.topics.new(topic_params)
      
          if @topic.save
            redirect_to sub_topic_path(@sub, @topic)
            # redirect_to [@sub, @topic] same thing just shorthand see rails routes
          else
            render partial: "form"
          end
        end
      
        def edit
          render partial: "form"
        end
      
        def update
          if @topic.update(topic_params)
            redirect_to [@sub, @topic] # see create right above if this doesn't make sense
          else
            render :edit
          end
        end
      
        def destroy
          @topic.destroy
          redirect_to sub_topics_path(@sub) # this is wrong on the lecture!!! if there is a sub_:id on the params field(middle field) you have to pass it in your method
        end
      
        private
          def set_sub
            @sub = Sub.find(params[:sub_id])
          end
      
          def set_topic
            @topic = Topic.find(params[:id])
          end
      
          def topic_params
            params.require(:topic).permit(:name, :body)
          end
end
