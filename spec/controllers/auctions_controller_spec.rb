require 'rails_helper'

RSpec.describe AuctionsController, :type => :controller do

  describe "#create" do

    context "with valid request" do
      
      def valid_request
        post :create, auction: {title: "Title", 
                              details: "Details", 
                              ends_on: Time.now + 10.days, reserve_price: 20}
      end

      it "creates a new auction in the database" do
        expect {valid_request}.to change{ Auction.count}.by(1)
      end

      it "redirects to auction show page" do
          valid_request
          expect(response).to redirect_to(auction_path(Auction.last))
      end

      it "sets flash message" do
        valid_request
        expect(flash[:notice]).to be
      end

    end

    context "with invalid request" do
      def invalid_request
        post :create, auction: { title: "asfd" }
      end

      it "doesnt create a record in the database" do
        expect{ invalid_request}.to_not change {Auction.count} 
      end

      it "renders new template" do
        invalid_request
        expect(response).to render_template(:new)
      end

    end
  end
end


