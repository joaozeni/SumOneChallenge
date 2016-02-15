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
        it "takes an array for argument" do
        end

        it "connects to the Twitter stream" do
        end

        it "posts the received tweets" do
        end

        it "ends when receive a command" do
        end
    end
end
