require 'spec_helper' 

describe Purchase do 

  describe "check_billing" do
    let(:purchase) { Purchase.new(first_name: "Audrey", last_name: "Carlsen", address1: "44 Hi St", city: "Seattle", state: "WA", zip: "98112")}

    context "when same address is checked" do
      it "assigns billing first name" do
        purchase.update(same_address: true)
        expect(purchase.billing_first).to eq(purchase.first_name)
      end
    end
  end
  
end

# [:first_name]
# [:last_name]
# [:address1]
# [:address2]
# [:city]
# [:state]
# [:zip]