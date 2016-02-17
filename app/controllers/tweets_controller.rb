class TweetsController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:create]
    def create
        @tweet = Tweet.find_or_initialize_by(user_param)
        @tweet.save
        puts "ID: #{@tweet.inspect}"
        
        @text = Text.create(text_param)
        @text.tweet = @tweet
        @text.save
        puts "ID2: #{@text.inspect}"
        
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
        params.require(:text).permit(:tweet_id, :text)
    end
end
