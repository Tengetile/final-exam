class BidsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_auction
  
  def create
    @bid = @auction.bids.new(bid_params)
    @bid.user = current_user
    respond_to do |format|
      if @bid.save
        format.html {redirect_to @auction, notice: "Bid created"}
        format.js do
          flash.now[:notice]= "Bid created"
          render 
        end
      else
        flash.now[:alert]= "Could not make a bid"
        format.html { render "/auctions/show"}
      end
    end
  end

  private

  def bid_params
   params.require(:bid).permit(:price) 
  end

  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

end
