class TweetsController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:create]
    def create
        #puts params[:user]
        @tweet = Tweet.new(user_param)
        #@tweet = Tweet.where(params[:user]).first_or_create
        #@tweet.save
        #@tweet.texts.create(text_param)
        @tweet.save
        render json: { message: "OK"}
    end

    def list
        @tweets = Tweet.all
    end
    private
    def user_param
        params.require(:user).permit(:user)
    end

    def text_param
        params.require(:text).permit(:tweet_id,:text)
    end
end
