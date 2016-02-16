class Tweet < ActiveRecord::Base
    validates_presence_of :user
    has_many :texts
end
