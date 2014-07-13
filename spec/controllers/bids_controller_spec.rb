require 'rails_helper'

RSpec.describe BidsController, :type => :controller do

  descibe "#create" do 

    context "with valid parameters" do
      
      def good_request
        post :create, auction_id: auction.id, bid: {price: 100}
      end

      it "it adds a bid to the given auction to the database" do 
        expect { good_request }.to change { auction.bids.count }.by(1)
      end

      it "redirect to auction show page" do
          good_request
          expect(response).to redirect_to(auction)
        end

    end

    context "with invalid parameters" do
       def bad_request
          post :create, auction_id: auction.id, bid: {price: -20}
        end

        it "doesn't create a new pledge record" do
          bad_request
          expect(auction.bids.count).to eq(0)
        end
    end
  end
end
