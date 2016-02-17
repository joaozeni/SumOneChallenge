class Text < ActiveRecord::Base
    belongs_to :tweet, :class_name => 'Tweet', :foreign_key => 'tweet_id'
end
