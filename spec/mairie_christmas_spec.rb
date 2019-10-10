require_relative '../lib/mairie_christmas'



describe "the mairie_christmas method" do
    it "Give the name and the code postale of the town" do
      expect(get_townhall_name("http://annuaire-des-mairies.com/95/aincourt.html")).to eq("AINCOURT - 95510")
      
    end
end

describe "the mairie_christmas method" do
    it "Give the email of the town" do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/aincourt.html")).to eq("mairie.aincourt@wanadoo.fr")
      
    end
end

describe "the mairie method" do
    it "should return a value for the 2 first names" do
        expect(perform[0].keys[0]).to eq("ABLEIGES - 95450")
        expect(perform[2].keys[0]).to eq("AMBLEVILLE - 95710")
    end
end



