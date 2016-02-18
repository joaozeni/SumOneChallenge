require_relative '../myCrawler'

describe MyCrawler do

    before :all do
        @crawler = MyCrawler.new
    end

    describe '#new' do
        it "starts the Twitter client" do
            @crawler.client.should be_an_instance_of Twitter::Streaming::Client
        end
    end

    describe '#craw' do
        it "connects to the Twitter stream" do
            @crawler.craw
            @crawler.filterThread.alive?.should be true
        end

        it "posts the received tweets" do
            @crawler.status.should eql 500
        end

        it "ends when receive a command" do
            @crawler.end_craw
            @crawler.filterThread.alive?.should_not be true
        end
    end
end
