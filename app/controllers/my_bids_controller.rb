class MyBidsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @bids = current_user.bids
  end

end
