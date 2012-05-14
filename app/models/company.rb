class Company < ActiveRecord::Base
  serialize :accreditations

  has_one :address, :as=>:addressable
  has_many :users

  accepts_nested_attributes_for :address

  validates :name, :tax_id, :uniqueness=>true, :presence=>true
  validates :company_type, :presence=>true, :inclusion => { :in=>%w( provider supporter ) }

  validates_associated :address
end
