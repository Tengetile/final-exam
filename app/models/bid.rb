class Bid < ActiveRecord::Base
  
  belongs_to :auction
  belongs_to :user

  #validates that the bid price is higher than the current price

end
