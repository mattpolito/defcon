require 'subdomain'

describe Subdomain do
  describe "#matches?" do
    context "when subdomain is in request" do
      context "and is reserved" do
        let(:request) { stub(:subdomain => "www") }

        it "returns false" do
          Subdomain.matches?(request).should be_false
        end
      end

      context "and is not reserved" do
        let(:request) { stub(:subdomain => "mattpolito") }

        it "returns true" do
          Subdomain.matches?(request).should be_true
        end
      end
    end

    context "when subdomain is not in request" do
      let(:request) { stub(:subdomain => "") }

      it "returns false" do
        Subdomain.matches?(request).should be_false
      end
    end
  end
end
