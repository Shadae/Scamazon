require 'spec_helper' 

describe Purchase do 
  let(:purchase) { Purchase.new(first_name: "Audrey", last_name: "Carlsen", address1: "44 Hi St", city: "Seattle", state: "WA", zip: "98112")}
  
  context "with valid attributes" do
    it "has a first name" do
      purchase.update(first_name: nil)

      expect(purchase).to be_invalid
    end
  end

  describe "check_billing" do

    context "when same address is checked" do
      it "assigns billing first name" do
        purchase.update(same_address: true)
        expect(purchase.billing_first).to eq(purchase.first_name)
      end
    end
  end
end
