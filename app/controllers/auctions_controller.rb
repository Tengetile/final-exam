class AuctionsController < ApplicationController
  
  before_action :find_auction, only: [:edit, :update, :destroy, :show]
  # before_action :authenticate_user!, only: [:new, :create, 
  #                                 :edit, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

   def create
      @auction = Auction.new(auction_params)
      #@auction.user = current_user
      if @auction.save
        redirect_to @auction, notice: "Auction Created"
      else
       render :new, alert: "Could not create an auction!"
      end
   end

  def show
    @bid = Bid.new
  end

  def edit
  end

  def update
    if @auction.update_attributes(auction_params)
      redirect_to @auction, notice: "Auction updated"
    else
      render :edit
    end  
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path, notice: "Auction deleted"
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end
end
