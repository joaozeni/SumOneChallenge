require 'twitter'
require 'unirest'

class MyCrawler

    attr_reader :client
    def initialize 
        @client = Twitter::Streaming::Client.new do |config|
            config.consumer_key = "dc6rGUkC5VCha0wyPrxEShn9H"
            config.consumer_secret = "crDx7kNDZBjOLUiV3TH953FzWhQXix11VECK2yyYj3qhqUE3zy"
            config.access_token = "14244472-fjH9hDSKih0XUuY4pzT0BdSTXWzYj5x6cDcKQZfgH"
            config.access_token_secret = "EdDJ1DUo4170HL71TuLJswHqkJFopRSxRIREj3XJYZCcz"
        end
    end

    def craw keyWords
        @client.filter(track: keyWords.join(",")) do |obj|
            if obj.is_a?(Twitter::Tweet) then
                response = Unirest.post "http://localhost:3000/", 
                    parameters:{ :user => "#{obj.user.screen_name}", :text => "#{obj.text}" }
                puts "usr: #{obj.user.screen_name}"
                puts "text: #{obj.text}"
            end
        end
    end

end

mc = MyCrawler.new
mc.craw ["superbowl", "beyonce"]
