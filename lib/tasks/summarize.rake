task summarize: :environment do
    @userWithMostTweets = ""
    @numberOfTweetsFromUser = 0
    @tweetsPerHour = Array.new(24) { |e| e = 0 }
    Tweet.find_each do |tweet|
        texts = Text.where("tweet_id = ?", tweet.id)
        if texts.size > @numberOfTweetsFromUser
            @numberOfTweetsFromUser = texts.size
            @userWithMostTweets = tweet.user
        end
        texts.each do |text|
            @tweetsPerHour[text.created_at.hour] += 1
        end
    end
    puts "User with Most tweets: #{@userWithMostTweets} - #{@numberOfTweetsFromUser} tweets"
    tweetsPerHourSummarizedString = "Tweets per hours : "
    @tweetsPerHour.each_with_index do |tweetThisHour, index|
        tweetsPerHourSummarizedString += "#{index}:00 -> #{tweetThisHour}, "
    end
    puts tweetsPerHourSummarizedString
end
