class Tweet < ActiveRecord::Base
    validates_presence_of :user
    has_many :texts, :class_name => 'Text', :foreign_key => 'text_id'
end
