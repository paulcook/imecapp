class Company < ActiveRecord::Base
  has_one :address
  has_many :users

end
