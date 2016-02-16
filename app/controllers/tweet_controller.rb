class TweetController < ApplicationController
    def create
        @tweet = Tweet.where(params[:user]).first_or_create
        @tweet.texts.create(:tweet_id:@tweet.id, params[:text])
        @tweet.save
    end

    def list 
        @tweets = Tweet.all
    end
end
