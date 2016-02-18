require 'twitter'
require 'rest-client'
require 'dotenv'
Dotenv.load 

class MyCrawler

    attr_reader :client, :status, :filterThread
    def initialize
        @client = Twitter::Streaming::Client.new do |config|
            config.consumer_key = ENV['CONSUMER_KEY']
            config.consumer_secret = ENV['CONSUMER_SECRET']
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
    end

    def craw 
        puts "ENV #{ENV['KEYWORDS']}"
        @filterThread = Thread.new { @client.filter(track: ENV['KEYWORDS']) do |obj|
            if obj.is_a?(Twitter::Tweet) then
                response = RestClient.post 'http://localhost:3000/tweets/create', :user => {:user => "#{obj.user.screen_name}"},:text => {:text => "#{obj.text}"}
                #@status = response.code
            end
        end }
        @filterThread.run
    end

    def end_craw
        @filterThread.exit
    end

end

mc = MyCrawler.new
mc.craw

@userInput = ""
while @userInput != 'q'
    puts "type q to end: "
    @userInput = gets.chomp
    puts "inputed #{@userInput}"
    if @userInput == 'q'
        mc.end_craw
    end
end
