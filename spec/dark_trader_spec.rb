require_relative '../lib/dark_trader'



describe "the dark_trader method" do
    it "should retrive " do
      expect(dark_trader.class).to eq(Array)
      
    end
end


describe " the dark_trader method" do
    it " says if the first element is an array" do
      expect(dark_trader[0].class).to eq(Hash)
      
    end
end




describe " the dark_trader method" do
    it " says if the first element is BTC" do
      expect(dark_trader[0].keys[0]).to eq("BTC")
      expect(dark_trader[1].keys[0]).to eq("ETH")
      expect(dark_trader[2].keys[0]).to eq("XRP")

    end
end
describe " the dark_trader method" do
    it " says if the number of keys is good" do
      expect(dark_trader.size > 2300).to eq(true)
    end
end


