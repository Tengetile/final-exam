class Auction < ActiveRecord::Base
  belongs_to :user

  has_many :bids

  validates :title, presence: true
  validates :details, presence: true
  validates :ends_on, presence: true
  validates :reserve_price, presence: true, numericality: {greater_than_or_equal_to: 0}
 



  

end
