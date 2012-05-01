class Company < ActiveRecord::Base
  serialize :accreditations
  has_one :address
  has_many :users

end
