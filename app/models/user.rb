class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :auctions
  has_many :bids
  def full_name
    if first_name || last_name
      first_name.capitalize!
      last_name.capitalize!
      "#{first_name} #{last_name}".squeeze(" ").strip
    end
  end


end
